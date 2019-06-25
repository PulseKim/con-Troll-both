#include "Optimizer.h"

Optimizer::Optimizer(const WorldPtr& world, std::string currentSide, std::string objName, double rad)
: mOriginalWorld(world), mCurrentHandName(currentSide), mCurrentObjName(objName)
{
	this->initiallize();
	this->setConstraints();
	this->randomizeInitialGuess();
	this->parameterSetting();
	mRad = rad;
}

Optimizer::Optimizer(const WorldPtr& world, const std::vector<Eigen::VectorXd> initialGuess, std::string currentSide, std::string objName, double rad)
: mOriginalWorld(world), mCurrentHandName(currentSide), mCurrentObjName(objName), mCurrentPoseSeries(initialGuess)
{
	this->initiallize();
	this->setConstraints();
	this->parameterSetting();
	mRad = rad;
}

void Optimizer::initiallize()
{
	mCurrentWorld = mOriginalWorld->clone();
	mCurrentHand = mCurrentWorld->getSkeleton(mCurrentHandName);
	mObj = mCurrentWorld->getSkeleton(mCurrentObjName);
	mController = dart::common::make_unique<Controller>(mCurrentHand);
}

void Optimizer::parameterSetting()
{
	single_step = mOriginalWorld->getTimeStep();
	total_steps = target_time / single_step;
	mObjOriginalPose = mObj->getCOM();
	mHandOriginalPose = mCurrentHand->getPositions();
	height_obj_copy = mObj->getCOM()[1] * 2;
	target_time = 0.3;
}


void Optimizer::randomizeInitialGuess()
{
	std::vector<double> guess{
		//Arm - Ball 
		0, 0, 0,
		//Arm - Univ & Wrist 
		0, 0, 0,
		//Thumb 
		0, 0, 0, 0, 0,
		//First Finger 
		0, 0, 0, 0,
		//Second Finger 
		0, 0, 0, 0,
		//Third Finger 
		0, 0, 0, 0,
		//Fourth Finger 
		0, 0, 0, 0
	};	
}

void Optimizer::setConstraints()
{
	//Here, manually sets the constraint - using exact anatomy
	std::vector<double> low_degs{
		//Arm - Ball Constraints x y z
		-360, -180, -180,
		//Arm - Univ & Wrist Constraints
		0, -70, -70, -35,
		//Thumb Constraints
		-180, -180, -10, -90, -10,
		//First Finger Constraints
		-45, -20, 0, 0,
		//Second Finger Constraints
		-45, -20, 0, 0,
		//Third Finger Constraints
		-45, -20, 0, 0,
		//Fourth Finger Constraints
		-45, -20, 0, 0
	};
	std::vector<double> up_degs{
		//Arm - Ball Constraints
		360, 180, 180,
		//Arm - Univ & Wrist Constraints
		145, 85, 75, 20,
		//Thumb Constraints
		180, 180, 10, 5, 55,
		//First Finger Constraints
		90, 20, 100, 80,
		//Second Finger Constraints
		90, 20, 100, 80,
		//Third Finger Constraints
		90, 20, 100, 80,
		//Fourth Finger Constraints
		90, 20, 100, 80
	};
	if(mCurrentHand->getName() == "arm_l")
	{
		up_degs[4] = 70;
		low_degs[4] = -85;
		up_degs[6] = 35;
		low_degs[6] = -20;
	}

	for(int i = 0; i < low_degs.size();++i)
	{
		lowerConstraints.push_back(this->degToRad(low_degs[i]));
		upperConstraints.push_back(this->degToRad(up_degs[i]));
	}
}


void Optimizer::optimization(std::string test_name)
{
	//Set previous Error by simulating once
	this->simulationStep(mCurrentPoseSeries);
	prev_error = this->calculateTotalError();
	std::cout << "initial error " << prev_error << std::endl;
	//Iterate for each parameters
	int mIter = 50;
	double epsilon = 0.001;
	double error = 0.0;
	for(int i =0 ; i < mIter; ++i)
	{
		std::cout << i+1 <<"th iteration" <<std::endl;

		//Error minimization algorithm
		for(int j = 0; j < mCurrentPoseSeries.size(); ++j){
			error = this->GDIterate(j);
			std::cout << "error is " << error << std::endl;
			if(error < epsilon){
				local_flag = mCurrentPoseSeries.size();
				break;
			}
			if(local_flag == mCurrentPoseSeries.size()) break;
		}
		if(local_flag == mCurrentPoseSeries.size()) break;
	}

	std::cout << "Final series poses are" << std::endl;
	for(int i = 0 ; i< mCurrentPoseSeries.size(); ++i)
		std::cout << mCurrentPoseSeries[i].transpose() << std::endl;

	//Write the result on the algorithm
	std::ofstream outFile(test_name+"txt");
	for(int i = 0; i< mCurrentPoseSeries.size();++i){
		outFile << "pose " << i << std::endl;
		for(int j=0; j < mCurrentPoseSeries[i].size(); ++j){
			outFile << mCurrentPoseSeries[i][j] << std::endl;
		}
	}

}

double Optimizer::GDIterate(int pose_numb)
{
	Eigen::VectorXd iterPose = mCurrentPoseSeries[pose_numb];
	Eigen::VectorXd iterPose_plus_eps = iterPose, iterPose_minus_eps = iterPose;
	Eigen::VectorXd grad = Eigen::VectorXd::Zero(iterPose.rows());
	std::vector<Eigen::VectorXd>series = mCurrentPoseSeries;

	double epsilon = this->degToRad(0.25);
	double lambda = 0.1;
	double max_angle_step = this->degToRad(15);

	for(int i = 0 ; i < iterPose.rows(); ++i)
	{
		iterPose_plus_eps = iterPose;
		iterPose_minus_eps = iterPose;
		series = mCurrentPoseSeries;
		iterPose_plus_eps[i]+= epsilon;
		iterPose_minus_eps[i]-= epsilon;

		series[pose_numb] = iterPose_plus_eps;
		this->simulationStep(series);
		double e_plus = this->calculateTotalError();

		series[pose_numb] = iterPose_minus_eps;
		this->simulationStep(series);
		double e_minus = this->calculateTotalError();

		grad[i] = (e_plus - e_minus) / (epsilon *2);
		std::cout << "error diff " << e_plus << " and " << e_minus << std::endl;
	}

	//Line Search
	int iter;
	int maxIter = 10;
	double old_error = prev_error;
	std::vector<Eigen::VectorXd> current_series = mCurrentPoseSeries;
	for(iter = 0 ; iter < maxIter; ++iter)
	{
		Eigen::VectorXd computed_grad = Eigen::VectorXd::Zero(iterPose.rows());
		computed_grad = lambda * grad;
		for(int i =0 ; i < grad.rows(); ++i){
			if(computed_grad[i] > max_angle_step) computed_grad[i] = max_angle_step;
			if(computed_grad[i] < -max_angle_step) computed_grad[i] = -max_angle_step;
		}
		current_series[pose_numb] = (mCurrentPoseSeries[pose_numb] - computed_grad);
		this->simulationStep(current_series);
		double current_error = calculateTotalError();
		std::cout << "error " << current_error << std::endl;
		if(current_error < prev_error)
		{
			prev_error = current_error;
			mCurrentPoseSeries = current_series;
		}
		lambda *=0.5;
	}

	if(old_error == prev_error)
		local_flag++;
	else
		local_flag = 0;

	return prev_error;
}

double Optimizer::SGDIterate(int pose_numb)
{
	Eigen::VectorXd iterPose = mCurrentPoseSeries[pose_numb];
	Eigen::VectorXd iterPose_plus_eps = iterPose, iterPose_minus_eps = iterPose;
	double grad;
	std::vector<Eigen::VectorXd>series = mCurrentPoseSeries;

	double epsilon = this->degToRad(0.25);
	double lambda;
	double max_angle_step = this->degToRad(15);
	double old_error = prev_error;

	for(int i = 0 ; i < iterPose.rows(); ++i)
	{
		lambda = 0.02;
		std::cout << "prev error: " << prev_error << std::endl;
		iterPose_plus_eps = iterPose;
		iterPose_minus_eps = iterPose;
		series = mCurrentPoseSeries;
		iterPose_plus_eps[i]+= epsilon;
		iterPose_minus_eps[i]-= epsilon;

		series[pose_numb] = iterPose_plus_eps;
		this->simulationStep(series);
		double e_plus = this->calculateTotalError();

		series[pose_numb] = iterPose_minus_eps;
		this->simulationStep(series);
		double e_minus = this->calculateTotalError();

		grad = (e_plus - e_minus) / (epsilon *2);
		std::cout << "error diff " << e_plus << " and " << e_minus << std::endl;
		//Line Search
		int iter;
		int maxIter = 8;
		std::vector<Eigen::VectorXd> current_series = mCurrentPoseSeries;
		for(iter = 0 ; iter < maxIter; ++iter)
		{
			double computed_grad;
			computed_grad = lambda * grad;
			if(computed_grad > max_angle_step) computed_grad = max_angle_step;
			if(computed_grad < -max_angle_step) computed_grad = -max_angle_step;
			current_series[pose_numb][i] = (mCurrentPoseSeries[pose_numb][i] - computed_grad);
			this->simulationStep(current_series);
			double current_error = calculateTotalError();
			std::cout << i << "th error " << current_error << std::endl;
			if(current_error < prev_error)
			{
				prev_error = current_error;
				mCurrentPoseSeries = current_series;
			}
			lambda *=0.5;
		}
	}


	if(old_error == prev_error)
		local_flag++;
	else
		local_flag = 0;

	return prev_error;
}

void Optimizer::simulationStep(std::vector<Eigen::VectorXd> series)
{
	this->initiallize();
	double rest_time = 0.5;
	int smoothing_step = target_time / mCurrentWorld->getTimeStep();
	int rest_step = rest_time / mCurrentWorld->getTimeStep() ;
	
	for(int j = 1; j < smoothing_step+1; ++j)
	{
		mController->clearForces();
		mController->addSPDForces();
		mController->setTargetPosition(this->smoothMovement(j, smoothing_step, mHandOriginalPose, series[0]));
		mCurrentWorld->step();
	}
	for(int i = 1; i < series.size(); ++i)
	{
		for(int j = 1; j < smoothing_step+1; ++j)
		{
			mController->clearForces();
			mController->addSPDForces();
			mController->setTargetPosition(this->smoothMovement(j, smoothing_step, series[i-1], series[i]));
			mCurrentWorld->step();
		}
	}
	for(int j = 0; j <rest_step ; ++j)
	{
		mController->clearForces();
		mController->addSPDForces();
		mCurrentWorld->step();
	}
	// std::cout << "current hand pose " << mCurrentHand->getPositions().transpose() << std::endl;
}

double Optimizer::calculateTotalError()
{
	double error = 0.0;
	double  w_cs = 2.0 ,w_d = 1.0 , w_os = 0.4, w_ct = 0.05, w_g, w_gq = 0.1;

	error += w_cs *this->constraintError();
	error += w_d * this->distanceError();
	error += w_os *this->objectStableError();
	error += w_ct *this->contactError();
	error += w_gq *this->graspingQuality();
	// error += w_d *this->graspingError();
	return error;
}

double Optimizer::objectStableError()
{
	return (mObj->getCOMLinearVelocity()).norm();
}

double Optimizer::graspingError()
{
	double error = 0.0;
	Eigen::Vector3d current_palm = mCurrentHand->getBodyNode("palm_patch")->getCOM();
	Eigen::Vector3d target_palm = current_palm;
	target_palm[1] += 0.2;
	std::vector<std::pair<Eigen::Vector3d, std::string>> End;
	End.push_back(std::make_pair(target_palm, "palm_patch"));

	IkSolver ik;
	Eigen::VectorXd current_pose = mCurrentHand->getPositions();
	Eigen::VectorXd move_up = ik.IKMultiple(mCurrentHand, End, 1000);
	int smoothing_step = target_time/ mCurrentWorld->getTimeStep();
	
	for(int j = 1; j < smoothing_step+1; ++j)
	{
		mController->clearForces();
		mController->addSPDForces();
		mController->setTargetPosition(this->smoothMovement(j, smoothing_step, current_pose, move_up));
		mCurrentWorld->step();
	}

	//Calculate the grasping error here

	return error;
}

double Optimizer::graspingQuality()
{
	double error = 0.0;
	BodyNode* currentbn = mCurrentHand->getBodyNode("thumbpatch");
	Eigen::Vector3d finger_pos = currentbn->getCOM();
	double cmf = finger_pos[1];
	double cmo = mObj->getCOM()[1];
	error += std::abs(cmf-cmo);

	return error;
}

double Optimizer::constraintError()
{
	double error = 0.0;
	double single_constraint_error = 1.0;
	//Single joint constraint error
	for(int i = 0; i < mCurrentHand->getNumDofs(); ++i)
	{
		// std::cout << mCurrentHand->getPosition(i) <<" and " << lowerConstraints[i] << " and " << upperConstraints[i] <<std::endl;
		if(mCurrentHand->getPosition(i) < lowerConstraints[i])	error +=single_constraint_error * (lowerConstraints[i] - mCurrentHand->getPosition(i));
		if(mCurrentHand->getPosition(i) > upperConstraints[i])	error +=single_constraint_error * (mCurrentHand->getPosition(i) - upperConstraints[i]);

	}
	//Multiple joint constraint error
	// std::cout << "const" << error << std::endl;
	//return
	return error;
}

double Optimizer::distanceError()
{
	double error = 0.0;
	BodyNode* currentbn;
	double dist_bound = 0.02;
	double soft_weight = 0.1;
	//Each finger distance except for thumb
	for(int idx = 0 ; idx < 4; ++idx){
		currentbn = mCurrentHand->getBodyNode("patch"+ std::to_string(idx));
		Eigen::Vector3d finger_pos = currentbn->getCOM();
		double y_diff;
		if(finger_pos[1] > height_obj_copy)
			y_diff= finger_pos[1] - height_obj_copy;

		else
			y_diff = 0.0;
		double plane_diff;
		plane_diff = this->diff2D(finger_pos[0], finger_pos[2], mObj->getCOM()[0], mObj->getCOM()[2]) - mRad;
		error += this->diff2D(plane_diff, y_diff, 0, 0);
	}
	currentbn = mCurrentHand->getBodyNode("thumbpatch");
	Eigen::Vector3d finger_pos = currentbn->getCOM();
	double y_diff;
	if(finger_pos[1] > height_obj_copy)
		y_diff= finger_pos[1] - height_obj_copy;

	else
		y_diff = 0.0;
	double plane_diff;
	plane_diff = this->diff2D(finger_pos[0], finger_pos[2], mObj->getCOM()[0], mObj->getCOM()[2]) - mRad;
	error += this->diff2D(plane_diff, y_diff, 0, 0);

	//soft palm distance error
	currentbn = mCurrentHand->getBodyNode("palm_patch");
	finger_pos = currentbn->getCOM();
	if(finger_pos[1] > height_obj_copy)
		y_diff= finger_pos[1] - height_obj_copy;

	else
		y_diff = 0.0;
	plane_diff = this->diff2D(finger_pos[0], finger_pos[2], mObj->getCOM()[0], mObj->getCOM()[2]) - mRad;
	if(plane_diff < dist_bound ) plane_diff = 0.0;
	else plane_diff -= dist_bound;

	error += soft_weight * this->diff2D(plane_diff, y_diff, 0, 0);

	return error;
}

std::vector<Eigen::VectorXd> Optimizer::resultGetter()
{
	return mCurrentPoseSeries;
}

double Optimizer::contactError()
{
	double error;
	auto collisionGroup = mCurrentWorld->getConstraintSolver()->getCollisionGroup();
	auto collisionEngine = mCurrentWorld->getConstraintSolver()->getCollisionDetector();
	auto newGroup = collisionEngine->createCollisionGroup(mCurrentHand.get());
	collisionGroup->removeShapeFramesOf(mObj.get());
	collisionGroup->removeShapeFramesOf(mCurrentHand.get());
	bool floorCollision = collisionGroup->collide(newGroup.get());

	collisionGroup->addShapeFramesOf(mObj.get());
	collisionGroup->addShapeFramesOf(mCurrentHand.get());

	if(floorCollision) error = 1.0;
	else error = 0.0;
	
	return error;
}


double Optimizer::timeGetter()
{
	return target_time;
}

Eigen::VectorXd Optimizer::smoothMovement(int current_idx, int total_steps, const Eigen::VectorXd original, const Eigen::VectorXd target)
{
	Eigen::VectorXd pose = original;
	for(int j = 0 ; j < target.size(); ++j){
		pose[j] = original[j] + (target[j] - original[j]) * current_idx / total_steps;
	}
	return pose;
}

double Optimizer::diff2D(double x1, double y1, double x2, double y2)
{
	return std::sqrt((x1-x2) * (x1-x2) + (y1-y2)* (y1-y2));
}

double Optimizer::degToRad(double degree)
{
	return degree * M_PI / 180;
}

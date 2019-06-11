#include "Optimizer.h"

double target_time = 0.3;
double height_obj_copy;

Optimizer::Optimizer(const WorldPtr& world, std::string currentSide, std::string objName, double rad)
: mOriginalWorld(world), mCurrentHandName(currentSide), mCurrentObjName(objName)
{
	this->initiallize();
	this->setConstraints();
	this->randomizeInitialGuess();
	this->parameterSetting();
	mRad = rad;
}

Optimizer::Optimizer(const WorldPtr& world, const Eigen::VectorXd initialGuess, std::string currentSide, std::string objName, double rad)
: mOriginalWorld(world), mCurrentHandName(currentSide), mCurrentObjName(objName), mCurrentGuess(initialGuess)
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
	height_obj_copy = mObj->getCOM()[1] * 2;
}

void Optimizer::parameterSetting()
{
	single_step = mOriginalWorld->getTimeStep();
	total_steps = target_time / single_step;
	mObjOriginalPose = mObj->getCOM();
	mHandOriginalPose = mCurrentHand->getPositions();
}

void Optimizer::optimization(std::string test_name)
{
	//Set previous Error by simulating once

	//Iterate for each parameters
	int mIter = 1000;
	double epsilon = 0.001;
	double error = 0.0;
	for(int i =0 ; i < mIter; ++i)
	{
		//Error minimization algorithm
	
	}
	//Write the result on the algorithm
	std::ofstream outFile(test_name+"txt");

}

void Optimizer::randomizeInitialGuess()
{
	mCurrentGuess = mObj->getPositions();
	std::vector<double> guess{
		//Arm - Ball Constraints
		0, 0, 0,
		//Arm - Univ & Wrist Constraints
		0, 0, 0,
		//Thumb Constraints
		0, 0, 0, 0, 0,
		//First Finger Constraints
		0, 0, 0, 0,
		//Second Finger Constraints
		0, 0, 0, 0,
		//Third Finger Constraints
		0, 0, 0, 0,
		//Fourth Finger Constraints
		0, 0, 0, 0
	};
	for(int i = 0; i < mCurrentGuess.rows(); ++i)
		mCurrentGuess[i] = this->degToRad(guess[i]);
}

void Optimizer::setConstraints()
{
	//Here, manually sets the constraint - using exact anatomy
	std::vector<double> low_degs{
		//Arm - Ball Constraints
		-360, -180, -180,
		//Arm - Univ & Wrist Constraints
		-180, -10, -90, 
		//Thumb Constraints
		-180, -180, -180, -180, 0,
		//First Finger Constraints
		-180, -180, -180, -180,
		//Second Finger Constraints
		-180, -180, -180, -180,
		//Third Finger Constraints
		-180, -180, -180, -180,
		//Fourth Finger Constraints
		-180, -180, -180, -180
	};
	std::vector<double> up_degs{
		//Arm - Ball Constraints
		360, 180, 180,
		//Arm - Univ & Wrist Constraints
		180, 180, 180,
		//Thumb Constraints
		180, 180, 180, 180, 0,
		//First Finger Constraints
		180, 180, 180, 180,
		//Second Finger Constraints
		180, 180, 180, 180,
		//Third Finger Constraints
		180, 180, 180, 180,
		//Fourth Finger Constraints
		180, 180, 180, 180
	};

	for(int i = 0; i < low_degs.size();++i)
	{
		lowerConstraints.push_back(this->degToRad(low_degs[i]));
		upperConstraints.push_back(this->degToRad(up_degs[i]));
	}
}

double Optimizer::constraintError()
{
	double error = 0.0;
	double single_constraint_error = 1.2;
	//Single joint constraint error
	for(int i = 0; i < mObj->getNumDofs(); ++i)
	{
		if(mCurrentHand->getPosition(i) < lowerConstraints[i]) error +=single_constraint_error;
		if(mCurrentHand->getPosition(i) > upperConstraints[i]) error +=single_constraint_error;
	}
	//Multiple joint constraint error

	//return
	return error;
}

double Optimizer::distanceError()
{
	double error = 0.0;
	BodyNode* currentbn;
	double soft_error = 0.05;

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
		plane_diff = diff2D(finger_pos[0], finger_pos[2], mObj->getCOM()[0], mObj->getCOM()[2]) - mRad;
		std::cout << plane_diff << std::endl;
		error += diff2D(plane_diff, y_diff, 0, 0);
		std::cout << "current error" << error << std::endl;
	}
	currentbn = mCurrentHand->getBodyNode("thumbpatch");
	Eigen::Vector3d finger_pos = currentbn->getCOM();
	double y_diff;
	if(finger_pos[1] > height_obj_copy)
		y_diff= finger_pos[1] - height_obj_copy;

	else
		y_diff = 0.0;
	double plane_diff;
	plane_diff = diff2D(finger_pos[0], finger_pos[2], mObj->getCOM()[0], mObj->getCOM()[2]) - mRad;
	error += diff2D(plane_diff, y_diff, 0, 0);

	//soft palm distance error
	currentbn = mCurrentHand->getBodyNode("palm_patch");
	finger_pos = currentbn->getCOM();
	if(finger_pos[1] > height_obj_copy)
		y_diff= finger_pos[1] - height_obj_copy;

	else
		y_diff = 0.0;
	plane_diff = diff2D(finger_pos[0], finger_pos[2], mObj->getCOM()[0], mObj->getCOM()[2]) - mRad;
	error += soft_error * diff2D(plane_diff, y_diff, 0, 0);

	return error;
}

Eigen::VectorXd Optimizer::resultGetter()
{
	return mCurrentGuess;
}

double Optimizer::contactError()
{
	return 0.0;
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

#include "MyWindow.h"


MyWindow::MyWindow(const WorldPtr& world) : SimWindow()
{
	this->setWorld(world);	
	this->initParameters();
	this->initWindowSetting();
	// this->playSavedMovement("test2_maxstep.txt");
	this->startOptimization();

}

void MyWindow::initParameters()
{
	mWorld->setGravity(Eigen::Vector3d(0, -9.81, 0));
	movement = false;
	series_movement = false;	
	total_steps = 300;
	rad_obj = 0.04;
	height_obj = 0.3;
}

void MyWindow::initWindowSetting()
{	
	this->initSkeleton();
	mControllerR = dart::common::make_unique<Controller>(mWorld->getSkeleton("arm_r"));
	mControllerL = dart::common::make_unique<Controller>(mWorld->getSkeleton("arm_l"));
	this->setEndEffector(0);
}

void MyWindow::startOptimization()
{
	this->initPoseGetter("arm_r", "object");
	Optimizer* op = new Optimizer(mWorld, poseSeries, "arm_r", "object", rad_obj);
	op->optimization("test6");
	poseSeries = op->resultGetter();
	series_movement = true;
	flag = 0;
	total_steps = op->timeGetter() / mWorld->getTimeStep();	
}

void MyWindow::initSkeleton()
{
	mFloor = Skeleton::create("floor");
	mArm_r = Skeleton::create("arm_r");
	mArm_l = Skeleton::create("arm_l");
	SkelParser skel;
	skel.weldBox(mFloor, "floor", Eigen::Vector3d(0.50, 0.03, 2.0), Eigen::Vector3d(0, 0.015, -1.0), 1.0, dart::Color::White());	
	mArmMaker = dart::common::make_unique<ArmMaker>(mArm_r, mArm_l);
	mArmMaker->makeFullArm(0.7, Eigen::Vector3d(0,0.4,0));
	mWorld->addSkeleton(mFloor);
	mWorld->addSkeleton(mArm_l);
	mWorld->addSkeleton(mArm_r);
	rest_poseR = mArm_r->getPositions();
	target_poseR = rest_poseR;

	this->setObject();
}

void MyWindow::setObject()
{
	mObj = Skeleton::create("object");
	SkelParser skel;
	skel.freeCylinder(mObj, "cylinder1", rad_obj, height_obj, Eigen::Vector3d(0,0, 0), 0.1, dart::Color::Red());
	mObj->setPosition(0, this->degToRad(90));
	mObj->setPosition(3, -0.08);
	mObj->setPosition(4, height_obj/2 + 0.001);
	mObj->setPosition(5, 0.55);
	mWorld->addSkeleton(mObj);
}

Eigen::VectorXd MyWindow::initialGuess(std::string arm_side, std::string obj_name)
{
	Eigen::VectorXd initGuess = mWorld->getSkeleton(arm_side)->getPositions();
	std::vector<std::pair<Eigen::Vector3d, std::string>> initEndGuess;
	Eigen::Vector3d centre_obj = mWorld->getSkeleton(obj_name)->getCOM();
	int side;
	double offsetx = 0.002;
	double offsety = 0.02;
	if(arm_side == "arm_l") side = 1;
	else if(arm_side == "arm_r") side = -1;
	for(int i =0 ; i < 4; ++i)
	{
		initEndGuess.push_back(std::make_pair(centre_obj+Eigen::Vector3d(0,height_obj/5*(4-i)+offsety*2,rad_obj+offsetx)- Eigen::Vector3d(0,centre_obj[1],0) ,"patch" + std::to_string(i)));
	}
	initEndGuess.push_back(std::make_pair(centre_obj+Eigen::Vector3d(-rad_obj-0.015,height_obj/5*4,-0.02)- Eigen::Vector3d(0,centre_obj[1],0) ,"palm_patch"));
	initEndGuess.push_back(std::make_pair(centre_obj+Eigen::Vector3d(0,height_obj + offsety, 0)- Eigen::Vector3d(0,centre_obj[1],0) , "thumbpatch"));

	IkSolver ik;
	initGuess = ik.IKMultiple(mWorld->getSkeleton(arm_side), initEndGuess, 2000);
	return initGuess;
}


void MyWindow::initPoseGetter(std::string arm_side, std::string obj_name)
{
	Eigen::VectorXd original_pose = mWorld->getSkeleton(arm_side)->getPositions();
	Eigen::VectorXd pose1;
	Eigen::VectorXd pose2;
	Eigen::VectorXd pose3;
	Eigen::VectorXd pose4;
	std::vector<std::pair<Eigen::Vector3d, std::string>> initGuess0;
	std::vector<std::pair<Eigen::Vector3d, std::string>> initGuess1;
	std::vector<std::pair<Eigen::Vector3d, std::string>> initGuess2;
	Eigen::Vector3d centre_obj = mWorld->getSkeleton(obj_name)->getCOM();
	
	int side;
	double offsetx = rad_obj/2;
	double offsety = 0.02;
	double offset_init = 0.025;
	double pose_x = 0.05;
	double pose_height1 = 0.2;
	if(arm_side == "arm_l") side = 1;
	else if(arm_side == "arm_r") side = -1;
	for(int i =0 ; i < 4; ++i)
	{
		initGuess0.push_back(std::make_pair(centre_obj+Eigen::Vector3d(-pose_x ,height_obj/5*(4-i)+offsety*2,rad_obj+offsetx)+ Eigen::Vector3d(0,pose_height1,0) ,"patch" + std::to_string(i)));
	}
	initGuess0.push_back(std::make_pair(centre_obj+Eigen::Vector3d(-pose_x -rad_obj-0.015,height_obj/5*4,-0.02)+ Eigen::Vector3d(0,pose_height1,0) ,"palm_patch"));
	initGuess0.push_back(std::make_pair(centre_obj+Eigen::Vector3d(-pose_x ,height_obj + offsety, 0)+ Eigen::Vector3d(0,pose_height1,0) , "thumbpatch"));

	IkSolver ik;
	pose1 = ik.IKMultiple(mWorld->getSkeleton(arm_side), initGuess0, 2000);
	for(int i =7; i < pose1.size(); ++i)
		pose1[i] = original_pose[i];

	for(int i =0 ; i < 4; ++i)
	{
		initGuess1.push_back(std::make_pair(centre_obj+Eigen::Vector3d(-pose_x-offset_init ,height_obj/5*(4-i)+offsety*2,rad_obj+offsetx)- Eigen::Vector3d(0,centre_obj[1],0) ,"patch" + std::to_string(i)));
	}
	initGuess1.push_back(std::make_pair(centre_obj+Eigen::Vector3d(-pose_x -rad_obj-0.005-offset_init,height_obj/5*4,0.0)- Eigen::Vector3d(0,centre_obj[1],0) ,"palm_patch"));
	initGuess1.push_back(std::make_pair(centre_obj+Eigen::Vector3d(-pose_x-offset_init ,height_obj+0.04, -offsetx)- Eigen::Vector3d(0,centre_obj[1],0) , "thumbpatch"));
	pose2 = ik.IKMultiple(mWorld->getSkeleton(arm_side), initGuess1, 2000);
	for(int i =7; i < pose1.size(); ++i)
		pose2[i] = original_pose[i];

	for(int i =0 ; i < 4; ++i)
	{
		initGuess2.push_back(std::make_pair(centre_obj+Eigen::Vector3d(-offset_init ,height_obj/5*(4-i)+offsety*2,rad_obj+offsetx)- Eigen::Vector3d(0,centre_obj[1],0) ,"patch" + std::to_string(i)));
	}
	initGuess2.push_back(std::make_pair(centre_obj+Eigen::Vector3d(-rad_obj-0.005-offset_init,height_obj/5*4,0.0)- Eigen::Vector3d(0,centre_obj[1],0) ,"palm_patch"));
	initGuess2.push_back(std::make_pair(centre_obj+Eigen::Vector3d(-offset_init ,height_obj+0.04, -offsetx)- Eigen::Vector3d(0,centre_obj[1],0) , "thumbpatch"));
	pose3 = ik.IKMultiple(mWorld->getSkeleton(arm_side), initGuess2, 2000);

	// pose4 = pose3;
	// for(int i =0; i < 6; ++i)
	// 	pose4[i] = pose1[i];

	poseSeries.push_back(pose1);
	poseSeries.push_back(pose2);
	poseSeries.push_back(pose3);
	// poseSeries.push_back(pose4);

}

void MyWindow::setEndEffector(int type)
{
	if(type == 0)
	{
		//Dummy End Effectors
		Ends.push_back(std::make_pair(Eigen::Vector3d(-0.0,0.02,0.0),"patch2"));
		// Ends.push_back(std::make_pair(Eigen::Vector3d(-0.28,0.35,0.71),1));
	}
	else if(type == 1)
	{

	}
	
}

Eigen::VectorXd MyWindow::handsup(std::string current_arm)
{
	std::vector<std::pair<Eigen::Vector3d, std::string>> handik;
	IkSolver ik;
	Eigen::VectorXd up_pose;
	Eigen::Vector3d current_com = mWorld->getSkeleton(current_arm)->getBodyNode("palm_patch")->getCOM();
	handik.push_back(std::make_pair(current_com + Eigen::Vector3d(0,0.05,0), "palm_patch"));
	Eigen::VectorXd weight = Eigen::VectorXd::Zero((mWorld->getSkeleton(current_arm)->getPositions().size()));
	for(int i =0 ;i < 6; ++i)
		weight[i]=1;
	up_pose = ik.IKMultipleFixedWeighted(mWorld->getSkeleton(current_arm), handik, weight,1000);
	return up_pose;
}

Eigen::VectorXd MyWindow::smoothMovement(int current_idx, int total_steps, const Eigen::VectorXd original, const Eigen::VectorXd target)
{
	Eigen::VectorXd pose = original;
	for(int j = 0 ; j < target.size(); ++j){
		pose[j] = original[j] + (target[j] - original[j]) * current_idx / total_steps;
	}
	return pose;
}

Eigen::VectorXd MyWindow::smoothMovementArmFirst(int current_idx, int total_steps, const Eigen::VectorXd original, const Eigen::VectorXd target)
{
	Eigen::VectorXd pose = original;
	if(current_idx  < total_steps / 2+1){
		for(int j = 0 ; j < 7; ++j){
			pose[j] = original[j] + (target[j] - original[j]) * 2 * current_idx / total_steps;
		}
		if(current_idx == total_steps / 2) middlepose = pose;
	}
	else
	{
		for(int j = 0 ; j < target.size(); ++j){
			pose[j] = middlepose[j] + (target[j] - middlepose[j]) * 2 * (current_idx - total_steps / 2) / total_steps;
		}
	}
	return pose;
}

void MyWindow::playSavedMovement(std::string filePath)
{
	std::ifstream openFile(filePath.data());
	double num;
	int local = 0;
	int cnt = 0;
	Eigen::VectorXd pose = rest_poseR;
	while(openFile >> num){
		if(local == 0 )
		{
			total_steps = num / mWorld->getTimeStep();
			local = 1;
		}
		else
		{
			if(cnt < pose.size()-1)
			{
				pose[cnt] = num;
				cnt++;
			}
			else
			{
				pose[cnt] = num;
				poseSeries.push_back(pose);
				cnt = 0;
			}
		}
    }
	openFile.close();
	series_movement = true;
	flag = 0;
}

void MyWindow::tempCollision()
{
	// std::cout << mWorld->getSimFrames() << std::endl;
	auto cont = mWorld->getLastCollisionResult().getContacts();
	// std::cout << cont[0].force <<std::endl;
	// std::cout << mWorld->getLastCollisionResult().getContact(0).force << std::endl;
	// for(int i= 0; i < cont.size(); ++i){
	// 	std::cout << mWorld->getLastCollisionResult().getContact(i).collisionObject1->getShapeFrame()->getName() <<std::endl;
	// 	std::cout << mWorld->getLastCollisionResult().getContact(i).collisionObject2->getShapeFrame()->getName() <<std::endl;
	// }
	auto collisionEngine = mWorld->getConstraintSolver()->getCollisionDetector();
	auto objGroup = collisionEngine->createCollisionGroup(mObj.get());
	auto finger1 = collisionEngine->createCollisionGroup((mArm_r->getBodyNode("distphalanx2")));
	auto handGroup = collisionEngine->createCollisionGroup();
	handGroup->addShapeFramesOf(mArm_r->getBodyNode("thumb distphalanx"));	
	handGroup->distance(objGroup.get());
	handGroup->removeShapeFramesOf(mArm_r->getBodyNode("thumb distphalanx"));
	for(int i =0 ; i < 4;++i){
		handGroup->addShapeFramesOf(mArm_r->getBodyNode("distphalanx"+ std::to_string(i)));
		std::cout <<"collide" << handGroup->collide(finger1.get()) << std::endl;
		handGroup->removeShapeFramesOf(mArm_r->getBodyNode("distphalanx"+ std::to_string(i)));
	}


}



void MyWindow::keyboard(unsigned char key, int x, int y)
{
	IkSolver ik;
	switch(key)
	{
		//Implement Here
		case 'a':
		rest_poseR = mArm_r->getPositions();
		target_poseR = this->handsup("arm_r");
		movement = true;
		flag = 0;
		break;
		case 's':		
		this->initPoseGetter("arm_r", "object");
		// mWorld->removeSkeleton(mObj);
		series_movement = true;
		flag = 0;
		break;
		case'q':
		this->tempCollision();
		break;
		default:
		SimWindow::keyboard(key, x, y);
	}	
}


void MyWindow::timeStepping()
{
	//Implement here
	//Controllers of both shoulder parts
	mControllerR->clearForces();
	mControllerL->clearForces();
	mControllerR->addSPDForces();
	mControllerL->addSPDForces();

	if(movement)
	{
		mControllerR->setTargetPosition(this->smoothMovement(flag, total_steps, rest_poseR, target_poseR));
		flag++;
		if(flag == total_steps) 
		{
			movement = false;
			rest_poseR = target_poseR;
			flag = 0;
		}
	}
	if(series_movement)
	{
		int n = poseSeries.size();
		if(flag < total_steps)
		{
			mControllerR->setTargetPosition(this->smoothMovement(flag+1, total_steps, rest_poseR, poseSeries[0]));
		}
		else if(flag <= total_steps * n)
		{
			for(int i = 1; i < n; ++i)
			{
				if(flag < total_steps * (i+1))
				{
					mControllerR->setTargetPosition(this->smoothMovement(flag%total_steps+1, total_steps, poseSeries[i-1], poseSeries[i]));
					break;
				}
			}			
		}
		else
		{
			series_movement = false;
			flag = 0;
			// auto contact = mWorld->getRecording()->getContactForce(mWorld->getSimFrames(), 0);
			// std::cout << contact<< std::endl;

		}

		flag++;
	}

	SimWindow::timeStepping();
}

void MyWindow::draw()
{
	glDisable(GL_LIGHTING);
	glPolygonMode(GL_FRONT_AND_BACK, GL_FILL);
	if (!mSimulating) {
		if (mPlayFrame < mWorld->getRecording()->getNumFrames()) {
			std::size_t nSkels = mWorld->getNumSkeletons();
			for (std::size_t i = 0; i < nSkels; i++) {
	        // std::size_t start = mWorld->getIndex(i);
	        // std::size_t size = mWorld->getSkeleton(i)->getNumDofs();
				mWorld->getSkeleton(i)->setPositions(mWorld->getRecording()->getConfig(mPlayFrame, i));
			}	      
			if (mShowMarkers) {
	        // std::size_t sumDofs = mWorld->getIndex(nSkels);
				int nContact = mWorld->getRecording()->getNumContacts(mPlayFrame);
				for (int i = 0; i < nContact; i++) {
					Eigen::Vector3d v = mWorld->getRecording()->getContactPoint(mPlayFrame, i);
					Eigen::Vector3d f = mWorld->getRecording()->getContactForce(mPlayFrame, i);

					glBegin(GL_LINES);
					glVertex3f(v[0], v[1], v[2]);
					glVertex3f(v[0] + f[0], v[1] + f[1], v[2] + f[2]);
					glEnd();
					mRI->setPenColor(Eigen::Vector3d(0.2, 0.2, 0.8));
					mRI->pushMatrix();
					glTranslated(v[0], v[1], v[2]);
					mRI->drawSphere(0.01);
					mRI->popMatrix();
				}
			}
		}
	} 
	else {glPointSize(10.0);  
		if (mShowMarkers) {
			const auto result =
			mWorld->getConstraintSolver()->getLastCollisionResult();
			for (const auto& contact : result.getContacts()) {
				Eigen::Vector3d v = contact.point;
				Eigen::Vector3d f = contact.force / 10.0;
				glBegin(GL_LINES);
				glVertex3f(v[0], v[1], v[2]);
				glVertex3f(v[0] + f[0], v[1] + f[1], v[2] + f[2]);
				glEnd();
				mRI->setPenColor(Eigen::Vector3d(0.2, 0.2, 0.8));
				mRI->pushMatrix();
				glTranslated(v[0], v[1], v[2]);
				mRI->drawSphere(0.01);
				mRI->popMatrix();
			}
		}
	}


	glEnable(GL_LIGHTING);
	drawWorld();
	glDisable(GL_LIGHTING);

	//Implement 2D factors inside here

	glEnable(GL_LIGHTING);

	  // display the frame count in 2D text
	char buff[64];
	if (!mSimulating)
	#ifdef _WIN32
		_snprintf(buff, sizeof(buff), "%d", mPlayFrame);
	#else
	std::snprintf(buff, sizeof(buff), "%d", mPlayFrame);
	#endif
	else
	#ifdef _WIN32
		_snprintf(buff, sizeof(buff), "%d", mWorld->getSimFrames());
	#else
	std::snprintf(buff, sizeof(buff), "%d", mWorld->getSimFrames());
	#endif
	std::string frame(buff);
	glColor3f(0.0, 0.0, 0.0);
	drawStringOnScreen(0.02f, 0.02f, frame);
	glEnable(GL_LIGHTING);
}

double MyWindow::degToRad(double degree)
{
	return degree * M_PI / 180;
}
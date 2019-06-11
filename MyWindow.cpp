#include "MyWindow.h"

Eigen::VectorXd rest_poseR;
Eigen::VectorXd target_poseR;
std::vector<std::pair<Eigen::Vector3d, std::string>> Ends;
bool movement;
int flag;
int total_steps = 300;
double rad_obj = 0.065;
double height_obj = 0.2;
Eigen::VectorXd middlepose;

MyWindow::MyWindow(const WorldPtr& world) : SimWindow()
{
	this->setWorld(world);	
	this->initWindowSetting();

}

void MyWindow::initWindowSetting()
{
	mWorld->setGravity(Eigen::Vector3d(0, -9.81, 0));
	this->initSkeleton();
	mControllerR = dart::common::make_unique<Controller>(mWorld->getSkeleton("arm_r"));
	mControllerL = dart::common::make_unique<Controller>(mWorld->getSkeleton("arm_l"));
	movement = false;
	
	this->setEndEffector(0);

}


void MyWindow::initSkeleton()
{
	mFloor = Skeleton::create("floor");
	mArm_r = Skeleton::create("arm_r");
	mArm_l = Skeleton::create("arm_l");
	SkelParser skel;
	skel.weldBox(mFloor, "floor", Eigen::Vector3d(2.0, 0.03, 2.0), Eigen::Vector3d(0, 0.015, -1.0), 1.0, dart::Color::White());	
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
	mObj->setPosition(3, -0.10);
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
	std::cout << centre_obj.transpose() << std::endl;
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
		for(int j = 0 ; j < 6; ++j){
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



void MyWindow::keyboard(unsigned char key, int x, int y)
{
	IkSolver ik;
	switch(key)
	{
		//Implement Here
		case 'a':
		target_poseR = this->initialGuess("arm_r", "object");
		movement = true;
		flag = 0;
		break;
		case 's':		
		target_poseR = ik.IKMultiple(mArm_r, Ends, 1000);
		movement = true;
		flag = 0;
		break;
		case'q':
		target_poseR[3] -= this->degToRad(5);
		movement = true;
		flag = 0;
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
	mControllerR->addSPDForces();
	mControllerL->clearForces();
	mControllerL->addSPDForces();

	if(movement)
	{
		mControllerR->setTargetPosition(this->smoothMovementArmFirst(flag, total_steps, rest_poseR, target_poseR));
		flag++;
		if(flag == total_steps) 
		{
			Optimizer* op = new Optimizer(mWorld,"arm_r", "object", rad_obj);
			std::cout << "dist error" << op->distanceError() << std::endl;
			movement = false;
			rest_poseR = target_poseR;
		}
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
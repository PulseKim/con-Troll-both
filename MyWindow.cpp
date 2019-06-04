#include "MyWindow.hpp"

Eigen::VectorXd rest_poseR;
Eigen::VectorXd target_poseR;
std::vector<std::pair<Eigen::Vector3d, int>> Ends;
bool movement;
int flag;
int total_steps = 300;

MyWindow::MyWindow(const WorldPtr& world) : SimWindow()
{
	this->setWorld(world);
	mWorld->setGravity(Eigen::Vector3d(0, -9.81, 0));
	this->initSkeleton();
	mControllerR = dart::common::make_unique<Controller>(
		mWorld->getSkeleton("arm_r"));
	mControllerL = dart::common::make_unique<Controller>(
		mWorld->getSkeleton("arm_l"));
	movement = false;

}

void MyWindow::initSkeleton()
{
	mFloor = Skeleton::create("floor");
	mArm_r = Skeleton::create("arm_r");
	mArm_l = Skeleton::create("arm_l");

	SkelParser skel;
	skel.weldBox(mFloor, "floor", Eigen::Vector3d(2.0, 0.03, 2.0), Eigen::Vector3d(0, 0.2, -1.0), 1.0, dart::Color::White());
	
	mArmMaker = dart::common::make_unique<ArmMaker>(mArm_r, mArm_l);
	mArmMaker->makeFullArm(0.7, Eigen::Vector3d(0,0.4,0));
	mWorld->addSkeleton(mFloor);
	mWorld->addSkeleton(mArm_l);
	mWorld->addSkeleton(mArm_r);
	rest_poseR = mArm_r->getPositions();
	target_poseR = rest_poseR;


	Ends.push_back(std::make_pair(Eigen::Vector3d(-0.25,0.35,0.7),0));
	Ends.push_back(std::make_pair(Eigen::Vector3d(-0.28,0.35,0.71),1));
	// Ends.push_back(std::make_pair(Eigen::Vector3d(),3));
	// Ends.push_back(std::make_pair(Eigen::Vector3d(),4));

}

Eigen::VectorXd MyWindow::smoothMovement(int current_idx, int total_steps, const Eigen::VectorXd target, const Eigen::VectorXd original)
{
	Eigen::VectorXd pose = original;
	for(int j = 0 ; j < target.size(); ++j){
		pose[j] = original[j] + (target[j] - original[j]) * current_idx / total_steps;
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
		// target_poseR[25] += 0.3;
		movement = true;
		flag = 0;
		break;

		case 's':		
		target_poseR = ik.IKMultiple(mArm_r, Ends, 1000);
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
		mControllerR->setTargetPosition(this->smoothMovement(flag, total_steps, target_poseR, rest_poseR));
		flag++;
		if(flag == total_steps) 
		{
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
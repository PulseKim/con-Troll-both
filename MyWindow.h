#include <iostream>
#include <dart/dart.hpp>
#include <dart/gui/gui.hpp>
#include <dart/utils/utils.hpp>
#include "ArmMaker.h"
#include "IkSolver.h"
#include "Optimizer.h"

using namespace dart::simulation;
using namespace dart::gui::glut;

class MyWindow: public SimWindow
{
public:
	MyWindow(const WorldPtr& world);

	//Initialization
	void initWindowSetting();
	void initSkeleton();

	//Smooth movement
	Eigen::VectorXd smoothMovement(int current_idx, int total_steps, const Eigen::VectorXd original, const Eigen::VectorXd target);
	Eigen::VectorXd smoothMovementArmFirst(int current_idx, int total_steps, const Eigen::VectorXd original, const Eigen::VectorXd target);
	void setObject();
	void setEndEffector(int type);
	Eigen::VectorXd initialGuess(std::string arm_side, std::string obj_name);

	//Overriding functions
	void keyboard(unsigned char key, int x, int y) override;
	void timeStepping() override;
	void draw() override;

	double degToRad(double degree);


protected:
	SkeletonPtr mFloor;
	SkeletonPtr mArm_r;
	SkeletonPtr mArm_l;
	SkeletonPtr mObj;
	std::unique_ptr<ArmMaker> mArmMaker;
	std::unique_ptr<Controller> mControllerR;
	std::unique_ptr<Controller> mControllerL;
	
};
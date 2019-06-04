#include <iostream>
#include <dart/dart.hpp>
#include <dart/gui/gui.hpp>
#include <dart/utils/utils.hpp>
#include "ArmMaker.hpp"
#include "Controller.hpp"
#include "IkSolver.hpp"

using namespace dart::simulation;
using namespace dart::gui::glut;

class MyWindow: public SimWindow
{
public:
	MyWindow(const WorldPtr& world);

	//Overriding functions
	void keyboard(unsigned char key, int x, int y) override;
	void timeStepping() override;
	void draw() override;

	//Initialization
	void initSkeleton();

	//Smooth movement
	Eigen::VectorXd smoothMovement(int current_idx, int total_steps, const Eigen::VectorXd target, const Eigen::VectorXd original);

	double degToRad(double degree);


protected:
	SkeletonPtr mFloor;
	SkeletonPtr mArm_r;
	SkeletonPtr mArm_l;
    std::unique_ptr<ArmMaker> mArmMaker;
    std::unique_ptr<Controller> mControllerR;
    std::unique_ptr<Controller> mControllerL;
	
};
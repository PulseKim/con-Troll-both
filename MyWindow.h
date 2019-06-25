#include <iostream>
#include <dart/dart.hpp>
#include <dart/gui/gui.hpp>
#include <dart/utils/utils.hpp>
#include "ArmMaker.h"
#include "Optimizer.h"

using namespace dart::simulation;
using namespace dart::gui::glut;

class MyWindow: public SimWindow
{
public:
	MyWindow(const WorldPtr& world);

	//Initialization
	void initParameters();
	void initWindowSetting();
	void initSkeleton();
	void initPoseGetter(std::string arm_side, std::string obj_name);

	void startOptimization();

	//Smooth movement
	Eigen::VectorXd handsup(std::string current_arm);
	Eigen::VectorXd smoothMovement(int current_idx, int total_steps, const Eigen::VectorXd original, const Eigen::VectorXd target);
	Eigen::VectorXd smoothMovementArmFirst(int current_idx, int total_steps, const Eigen::VectorXd original, const Eigen::VectorXd target);
	
	//EndEffector
	void setObject();
	void setEndEffector(int type);
	Eigen::VectorXd initialGuess(std::string arm_side, std::string obj_name);

	//Overriding functions
	void keyboard(unsigned char key, int x, int y) override;
	void timeStepping() override;
	void draw() override;

	double degToRad(double degree);
	void tempCollision();

protected:
	SkeletonPtr mFloor;
	SkeletonPtr mArm_r;
	SkeletonPtr mArm_l;
	SkeletonPtr mObj;
	std::unique_ptr<ArmMaker> mArmMaker;
	std::unique_ptr<Controller> mControllerR;
	std::unique_ptr<Controller> mControllerL;
	Eigen::VectorXd rest_poseR;
	Eigen::VectorXd target_poseR;
	std::vector<std::pair<Eigen::Vector3d, std::string>> Ends;
	std::vector<Eigen::VectorXd> poseSeries;
	bool movement;
	bool series_movement;
	int flag;
	int total_steps;
	double rad_obj;
	double height_obj;
	Eigen::VectorXd middlepose;
	
};
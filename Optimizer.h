#include <iostream>
#include <dart/dart.hpp>
#include <dart/gui/gui.hpp>
#include <dart/utils/utils.hpp>
#include <fstream>
#include "Controller.h"
using namespace dart::dynamics;
using namespace dart::simulation;

class Optimizer
{
public:
	Optimizer(const WorldPtr& world, std::string currentSide, std::string objName);
	Optimizer(const WorldPtr& world, const Eigen::VectorXd initialGuess, std::string currentSide, std::string objName);
	
	//Set initial conditions
	void initiallize();
	void parameterSetting();
	void setConstraints();
	void randomizeInitialGuess();

	//Minimizing algorithm
	void optimization(std::string test_name);

	//Compute the error
	double contactError();
	double constraintError();
	double graspingError();

	//Useful functions
	Eigen::VectorXd smoothMovement(int current_idx, int total_steps, const Eigen::VectorXd original, const Eigen::VectorXd target);
	double degToRad(double degree);
	Eigen::VectorXd resultGetter();

protected:
	WorldPtr mOriginalWorld;
	WorldPtr mCurrentWorld;
	std::string mCurrentHandName;
	std::string mCurrentObjName;
	SkeletonPtr mObj;
	SkeletonPtr mCurrentHand;
	Eigen::VectorXd mCurrentGuess;
	std::unique_ptr<Controller> mController;
	Eigen::Vector3d mObjOriginalPose;
	Eigen::VectorXd mHandOriginalPose;

	std::vector<double> lowerConstraints;
	std::vector<double> upperConstraints;	
	double single_step;
	int total_steps;
	double prev_error;
};
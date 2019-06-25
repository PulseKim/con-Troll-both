#include <iostream>
#include <dart/dart.hpp>
#include <dart/gui/gui.hpp>
#include <dart/utils/utils.hpp>
#include <fstream>
#include "Controller.h"
#include "IkSolver.h"
using namespace dart::dynamics;
using namespace dart::simulation;

class Optimizer
{
public:
	Optimizer(const WorldPtr& world, std::string currentSide, std::string objName, double rad);
	Optimizer(const WorldPtr& world, const std::vector<Eigen::VectorXd> initialGuess, std::string currentSide, std::string objName, double rad);
	
	//Set initial conditions
	void initiallize();
	void parameterSetting();
	void setConstraints();
	void randomizeInitialGuess();

	//Minimizing algorithm
	void optimization(std::string test_name);
	double GDIterate(int pose_numb);
	double SGDIterate(int pose_numb);
	void simulationStep(std::vector<Eigen::VectorXd> series);

	//Compute the error
	double calculateTotalError();
	double objectStableError();
	double distanceError();
	double contactError();
	double constraintError();
	double graspingError();
	double graspingQuality();

	//Useful functions
	Eigen::VectorXd smoothMovement(int current_idx, int total_steps, const Eigen::VectorXd original, const Eigen::VectorXd target);
	double degToRad(double degree);
	double diff2D(double x1, double y1, double x2, double y2);
	std::vector<Eigen::VectorXd> resultGetter();
	double timeGetter();

protected:
	WorldPtr mOriginalWorld;
	WorldPtr mCurrentWorld;
	std::string mCurrentHandName;
	std::string mCurrentObjName;
	SkeletonPtr mObj;
	SkeletonPtr mCurrentHand;
	std::unique_ptr<Controller> mController;
	Eigen::Vector3d mObjOriginalPose;
	Eigen::VectorXd mHandOriginalPose;
	std::vector<Eigen::VectorXd> mCurrentPoseSeries;

	std::vector<double> lowerConstraints;
	std::vector<double> upperConstraints;	
	double mRad;
	double single_step;
	int total_steps;
	double prev_error;
	double target_time;
	double height_obj_copy;
	int local_flag;
};
#include <iostream>
#include <dart/dart.hpp>
#include <dart/gui/gui.hpp>
#include <dart/utils/utils.hpp>
using namespace dart::common;
using namespace dart::dynamics;


class IkSolver{
public: 
	IkSolver();
	Eigen::VectorXd IKMultiple(const SkeletonPtr& hand, std::vector<std::pair<Eigen::Vector3d, int>> Ends, int total_iter);

};
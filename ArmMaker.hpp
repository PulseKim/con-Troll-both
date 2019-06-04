#include "SkelParser.hpp"
#include <iostream>
#include <dart/dart.hpp>
#include <dart/gui/gui.hpp>
#include <dart/utils/utils.hpp>

using namespace dart::simulation;
using namespace dart::gui::glut;

class ArmMaker{
public: 
	ArmMaker(const SkeletonPtr& rightArm_, const SkeletonPtr& leftArm_);

	void makeFullArm(double length, const Eigen::Vector3d location);
	void makeLeftArm(double length, const Eigen::Vector3d location);
	void makeRightArm(double length, const Eigen::Vector3d location);
	void makeArmPart(double length, int dir);
	void makePalm(int dir);
	void makeFingers(int dir);
	void makeSingleFinger(int idx, int dir);
	void makeThumb(int dir);

protected:
	SkeletonPtr leftArm;
	SkeletonPtr rightArm;
	SkelParser skel;
	BodyNode* currentParent;
	Eigen::Vector3d palmSize;
};
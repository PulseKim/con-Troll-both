#include "SkelParser.h"
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
	void makeArmPart(double length);
	void makePalm();
	void makeFingers();
	void makeSingleFinger(int idx);
	void makeThumb();

protected:
	SkeletonPtr leftArm;
	SkeletonPtr rightArm;
	SkeletonPtr currentArm;
	SkelParser skel;
	int currentDirection;
	BodyNode* currentParent;
	Eigen::Vector3d palmSize;
};
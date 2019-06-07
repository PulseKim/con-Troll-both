#include "ArmMaker.h"

#define LEFT  0
#define RIGHT 1


ArmMaker::ArmMaker
(const SkeletonPtr& rightArm_, const SkeletonPtr& leftArm_) : rightArm(rightArm_), leftArm(leftArm_)
{

}


void ArmMaker::makeFullArm(double length, const Eigen::Vector3d location)
{
	Eigen::Vector3d location_r = location;
	Eigen::Vector3d location_l = location;
	location_r[0] -= length/4;
	location_l[0] += length/4;

	this->makeRightArm(length/2, location_r);
	this->makeLeftArm(length/2, location_l);
	int index_thumb = rightArm->getIndexOf(rightArm->getBodyNode("thumbball")->getParentJoint()->getDof(0));
	// rightArm->setPosition(index_thumb, 30*M_PI/180);
	rightArm->setPosition(index_thumb+1, 30*M_PI/180);
	rightArm->setPosition(index_thumb+2, -80*M_PI/180);
	leftArm->setPosition(index_thumb+1, -30*M_PI/180);
	leftArm->setPosition(index_thumb+2, 80*M_PI/180);
}

void ArmMaker::makeRightArm(double length, const Eigen::Vector3d location)
{
	currentArm = rightArm;
	currentDirection = RIGHT;
	Eigen::Vector3d boxsize(length,0.1,0.1);
	double mass = 0.7;
	BodyNode* bn = skel.weldBox(rightArm, "right shoulder",boxsize, -1 * location, mass, dart::Color::Blue());
	currentParent = bn;
	this->makeArmPart(length);
	this->makePalm();
	this->makeFingers();
}

void ArmMaker::makeLeftArm(double length, const Eigen::Vector3d location)
{
	currentArm = leftArm;
	currentDirection = LEFT;
	Eigen::Vector3d boxsize(length,0.1,0.1);
	double mass = 0.7;
	BodyNode* bn = skel.weldBox(leftArm, "left shoulder",boxsize, -1 * location, mass, dart::Color::Blue());
	currentParent = bn;
	this->makeArmPart(length);
	this->makePalm();
	this->makeFingers();
}

void ArmMaker::makeArmPart(double length)
{
	double arm_rad = 0.05;
	double arm_len = 0.3; 
	double mass = 0.7;

	Eigen::Vector3d color = dart::Color::Fuchsia();

	BodyNode* bn;
	int sign = 1;
	if(currentDirection == RIGHT) sign = -1;
	bn = skel.ballCylinder(currentArm, currentParent, "arm uppper part right", arm_rad, arm_len, Eigen::Vector3d(0, 0, -arm_len/2), Eigen::Vector3d(sign * length/2,0,0), mass, color);
	bn = skel.univCylinder(currentArm, bn, "arm lower part right",Eigen::Vector3d::UnitX(), Eigen::Vector3d::UnitZ(), arm_rad, arm_len, Eigen::Vector3d(0, 0, -arm_len/2), Eigen::Vector3d(0,0,arm_len/2), mass, color);
	
	currentParent = bn;
}

void ArmMaker::makePalm()
{
	BodyNode* bn;
	Eigen::Vector3d boxsize(0.1, 0.02, 0.09);
	palmSize = boxsize;
	Eigen::Vector3d color = dart::Color::Green();
	double mass = 0.2;

	bn = skel.revolBox(currentArm, currentParent, "palm", Eigen::Vector3d::UnitX(), boxsize, Eigen::Vector3d(0,0,-boxsize[2]/2), Eigen::Vector3d(0,0,0.15), mass, color);
	skel.weldBox(currentArm, bn, "palm_patch", Eigen::Vector3d(0.005,0.00001,0.005), Eigen::Vector3d(0,0,0), Eigen::Vector3d(0,-boxsize[1]/2,0), 0.00000001, dart::Color::Orange());

	currentParent = bn;
}

void ArmMaker::makeFingers()
{
	this->makeThumb();
	for(int i = 0; i < 4; ++i)
		this->makeSingleFinger(i);
}

void ArmMaker::makeSingleFinger(int idx)
{
	BodyNode* bn;
	Eigen::Vector3d color = dart::Color::Green();
	double gap = 0.001;
	double fing_x = palmSize[0] / 4 - gap;
	double fing_len = 0.07;
	double mass_long = 0.04;
	double mass_short = 0.02;
	double epsilon = 0.000000001;
	Eigen::Vector3d patch(0.005, epsilon, 0.005);
	double offset;

	if(currentDirection == LEFT)
		offset = -palmSize[0]/2 + gap*idx + fing_x/2 + fing_x * idx;
	else
		offset = palmSize[0]/2 -(gap*idx + fing_x/2 + fing_x * idx);
	Eigen::Vector3d boxsize(fing_x, palmSize[1], fing_len);
	bn = skel.univBox(currentArm, currentParent, "univ"+std::to_string(idx), Eigen::Vector3d::UnitX(), Eigen::Vector3d::UnitY(), boxsize, Eigen::Vector3d(0,0,-boxsize[2]/2), Eigen::Vector3d(offset, 0, palmSize[2]/2), mass_long , color);
	boxsize[2] = 0.05;
	bn = skel.revolBox(currentArm, bn, "revolprox"+std::to_string(idx), Eigen::Vector3d::UnitX(), boxsize, Eigen::Vector3d(0,0,-boxsize[2]/2), Eigen::Vector3d(0,0,fing_len/2), mass_short, color);
	fing_len = 0.05;
	boxsize[2] = 0.03;
	bn = skel.revolBox(currentArm, bn, "revoldist"+std::to_string(idx), Eigen::Vector3d::UnitX(), boxsize, Eigen::Vector3d(0,0,-boxsize[2]/2), Eigen::Vector3d(0,0,fing_len/2), mass_short, color);		
	bn = skel.weldBox(currentArm, bn, "patch" + std::to_string(idx), patch, Eigen::Vector3d(0,0,0), Eigen::Vector3d(0,-boxsize[1]/2, boxsize[2]/2-patch[2]/2), epsilon, dart::Color::Orange());
}

void ArmMaker::makeThumb()
{
	BodyNode* bn;
	Eigen::Vector3d color = dart::Color::Green();
	double fing_x = palmSize[0] / 3;
	double fing_len = 0.06;
	double theta = 30 * M_PI / 180;
	double mass_long = 0.04;
	double mass_short = 0.02;
	double epsilon = 0.000000001;
	Eigen::Vector3d patch(0.005, epsilon, 0.005);
	Eigen::Vector3d offset;
	if(currentDirection == LEFT)
		offset = Eigen::Vector3d(-palmSize[0]/2, 0, -palmSize[2]/2);
	else
		offset = Eigen::Vector3d(palmSize[0]/2, 0, -palmSize[2]/2);
	Eigen::Vector3d boxsize(fing_x, palmSize[1], fing_len);

	bn = skel.ballBox(currentArm, currentParent, "thumbball", boxsize, Eigen::Vector3d(0,0,-boxsize[2]/2), offset, mass_long, color);
	boxsize[2] = 0.05;
	bn = skel.revolBox(currentArm, bn, "thumbrevolprox", Eigen::Vector3d::UnitX(), boxsize, Eigen::Vector3d(0,0,-boxsize[2]/2), Eigen::Vector3d(0,0,fing_len/2), mass_short, color);
	fing_len = 0.05;
	boxsize[2] = 0.03;
	bn = skel.revolBox(currentArm, bn, "thumbrevoldist", Eigen::Vector3d::UnitX(), boxsize, Eigen::Vector3d(0,0,-boxsize[2]/2), Eigen::Vector3d(0,0,fing_len/2), mass_short, color);		
	bn = skel.weldBox(currentArm, bn, "thumbpatch", patch, Eigen::Vector3d(0,0,0), Eigen::Vector3d(0,-boxsize[1]/2, boxsize[2]/2-patch[2]/2), epsilon, dart::Color::Orange());
}
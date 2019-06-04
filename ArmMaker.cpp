#include "ArmMaker.hpp"

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
	int index_thumb = rightArm->getIndexOf(rightArm->getBodyNode("thumbuniv")->getParentJoint()->getDof(0));
	rightArm->setPosition(index_thumb, 30 * M_PI / 180);
	leftArm->setPosition(index_thumb, 30 * M_PI / 180);

}

void ArmMaker::makeRightArm(double length, const Eigen::Vector3d location)
{
	Eigen::Vector3d boxsize(length,0.1,0.1);
	double mass = 0.7;
	BodyNode* bn = skel.weldBox(rightArm, "right shoulder",boxsize, -1 * location, mass, dart::Color::Blue());
	currentParent = bn;
	this->makeArmPart(length, RIGHT);
	this->makePalm(RIGHT);
	this->makeFingers(RIGHT);
}

void ArmMaker::makeLeftArm(double length, const Eigen::Vector3d location)
{
	Eigen::Vector3d boxsize(length,0.1,0.1);
	double mass = 0.7;
	BodyNode* bn = skel.weldBox(leftArm, "left shoulder",boxsize, -1 * location, mass, dart::Color::Blue());
	currentParent = bn;
	this->makeArmPart(length, LEFT);
	this->makePalm(LEFT);
	this->makeFingers(LEFT);
}

void ArmMaker::makeArmPart(double length, int dir)
{
	double arm_rad = 0.05;
	double arm_len = 0.3; 
	double mass = 0.7;

	Eigen::Vector3d color = dart::Color::Fuchsia();

	BodyNode* bn;
	if(dir == LEFT)
	{
		bn = skel.ballCylinder(leftArm, currentParent, "arm uppper part left", arm_rad, arm_len, Eigen::Vector3d(0, 0, -arm_len/2), Eigen::Vector3d(length/2,0,0), mass, color);
		bn = skel.univCylinder(leftArm, bn, "arm lower part left",Eigen::Vector3d::UnitX(), Eigen::Vector3d::UnitZ(), arm_rad, arm_len, Eigen::Vector3d(0, 0, -arm_len/2), Eigen::Vector3d(0,0,arm_len/2), mass, color);
	}
	else
	{
		bn = skel.ballCylinder(rightArm, currentParent, "arm uppper part right", arm_rad, arm_len, Eigen::Vector3d(0, 0, -arm_len/2), Eigen::Vector3d(-length/2,0,0), mass, color);
		bn = skel.univCylinder(rightArm, bn, "arm lower part right",Eigen::Vector3d::UnitX(), Eigen::Vector3d::UnitZ(), arm_rad, arm_len, Eigen::Vector3d(0, 0, -arm_len/2), Eigen::Vector3d(0,0,arm_len/2), mass, color);
	}	
	currentParent = bn;
}

void ArmMaker::makePalm(int dir)
{
	BodyNode* bn;
	Eigen::Vector3d boxsize(0.1, 0.02, 0.09);
	palmSize = boxsize;
	Eigen::Vector3d color = dart::Color::Green();
	double mass = 0.2;

	if(dir == LEFT)
	{
		bn = skel.revolBox(leftArm, currentParent, "left palm", Eigen::Vector3d::UnitX(), boxsize, Eigen::Vector3d(0,0,-boxsize[2]/2), Eigen::Vector3d(0,0,0.15), mass, color);
	}
	else
	{
		bn = skel.revolBox(rightArm, currentParent, "right palm", Eigen::Vector3d::UnitX(), boxsize, Eigen::Vector3d(0,0,-boxsize[2]/2), Eigen::Vector3d(0,0,0.15), mass, color);

	}	
	currentParent = bn;
}

void ArmMaker::makeFingers(int dir)
{
	this->makeThumb(dir);
	for(int i = 0; i < 4; ++i)
		this->makeSingleFinger(i, dir);
}

void ArmMaker::makeSingleFinger(int idx, int dir)
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
	if(dir == LEFT)
	{
		double offset = -palmSize[0]/2 + gap*idx + fing_x/2 + fing_x * idx;
		Eigen::Vector3d boxsize(fing_x, palmSize[1], fing_len);
		bn = skel.univBox(leftArm, currentParent, "univ"+std::to_string(idx), Eigen::Vector3d::UnitX(), Eigen::Vector3d::UnitY(), boxsize, Eigen::Vector3d(0,0,-boxsize[2]/2), Eigen::Vector3d(offset, 0, palmSize[2]/2), mass_long , color);
		boxsize[2] = 0.05;
		bn = skel.revolBox(leftArm, bn, "revolprox"+std::to_string(idx), Eigen::Vector3d::UnitX(), boxsize, Eigen::Vector3d(0,0,-boxsize[2]/2), Eigen::Vector3d(0,0,fing_len/2), mass_short, color);
		fing_len = 0.05;
		boxsize[2] = 0.03;
		bn = skel.revolBox(leftArm, bn, "revoldist"+std::to_string(idx), Eigen::Vector3d::UnitX(), boxsize, Eigen::Vector3d(0,0,-boxsize[2]/2), Eigen::Vector3d(0,0,fing_len/2), mass_short, color);		
		bn = skel.weldBox(leftArm, bn, "patch" + std::to_string(idx), patch, Eigen::Vector3d(0,0,0), Eigen::Vector3d(0,-boxsize[1]/2, boxsize[2]/2-patch[2]/2), epsilon, dart::Color::Orange());
	}
	else
	{
		double offset = palmSize[0]/2 -(gap*idx + fing_x/2 + fing_x * idx);
		Eigen::Vector3d boxsize(fing_x, palmSize[1], fing_len);
		bn = skel.univBox(rightArm, currentParent, "univ"+std::to_string(idx), Eigen::Vector3d::UnitX(), Eigen::Vector3d::UnitY(), boxsize, Eigen::Vector3d(0,0,-boxsize[2]/2), Eigen::Vector3d(offset, 0, palmSize[2]/2), mass_long, color);
		boxsize[2] = 0.05;
		bn = skel.revolBox(rightArm, bn, "revolprox"+std::to_string(idx), Eigen::Vector3d::UnitX(), boxsize, Eigen::Vector3d(0,0,-boxsize[2]/2), Eigen::Vector3d(0,0,fing_len/2), mass_short, color);
		fing_len = 0.05;
		boxsize[2] = 0.03;
		bn = skel.revolBox(rightArm, bn, "revoldist"+std::to_string(idx), Eigen::Vector3d::UnitX(), boxsize, Eigen::Vector3d(0,0,-boxsize[2]/2), Eigen::Vector3d(0,0,fing_len/2), mass_short, color);		
		bn = skel.weldBox(rightArm, bn, "patch" + std::to_string(idx), patch, Eigen::Vector3d(0,0,0), Eigen::Vector3d(0,-boxsize[1]/2, boxsize[2]/2-patch[2]/2), epsilon, dart::Color::Orange());

	}
}

void ArmMaker::makeThumb(int dir)
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
	if(dir == LEFT)
	{
		Eigen::Vector3d offset(-palmSize[0]/2, 0, -palmSize[2]/2);
		Eigen::Vector3d boxsize(fing_x, palmSize[1], fing_len);
		bn = skel.univBox(leftArm, currentParent, "thumbuniv", Eigen::Vector3d::UnitX(), Eigen::Vector3d::UnitY(), boxsize, Eigen::Vector3d(0,0,-boxsize[2]/2), offset, mass_long, color);
		boxsize[2] = 0.05;
		bn = skel.revolBox(leftArm, bn, "thumbrevolprox", Eigen::Vector3d::UnitX(), boxsize, Eigen::Vector3d(0,0,-boxsize[2]/2), Eigen::Vector3d(0,0,fing_len/2), mass_short, color);
		fing_len = 0.05;
		boxsize[2] = 0.03;
		bn = skel.revolBox(leftArm, bn, "thumbrevoldist", Eigen::Vector3d::UnitX(), boxsize, Eigen::Vector3d(0,0,-boxsize[2]/2), Eigen::Vector3d(0,0,fing_len/2), mass_short, color);		
		bn = skel.weldBox(leftArm, bn, "thumbpatch", patch, Eigen::Vector3d(0,0,0), Eigen::Vector3d(0,-boxsize[1]/2, boxsize[2]/2-patch[2]/2), epsilon, dart::Color::Orange());

	}
	else
	{
		Eigen::Vector3d offset(palmSize[0]/2, 0, -palmSize[2]/2);
		Eigen::Vector3d boxsize(fing_x, palmSize[1], fing_len);
		bn = skel.univBox(rightArm, currentParent, "thumbuniv", Eigen::Vector3d::UnitX(), Eigen::Vector3d::UnitY(), boxsize, Eigen::Vector3d(0,0,-boxsize[2]/2), offset, mass_long, color);
		boxsize[2] = 0.05;
		bn = skel.revolBox(rightArm, bn, "thumbrevolprox", Eigen::Vector3d::UnitX(), boxsize, Eigen::Vector3d(0,0,-boxsize[2]/2), Eigen::Vector3d(0,0,fing_len/2), mass_short, color);
		fing_len = 0.05;
		boxsize[2] = 0.03;
		bn = skel.revolBox(rightArm, bn, "thumbrevoldist", Eigen::Vector3d::UnitX(), boxsize, Eigen::Vector3d(0,0,-boxsize[2]/2), Eigen::Vector3d(0,0,fing_len/2), mass_short, color);
		bn = skel.weldBox(rightArm, bn, "thumbpatch", patch, Eigen::Vector3d(0,0,0), Eigen::Vector3d(0,-boxsize[1]/2, boxsize[2]/2-patch[2]/2), epsilon, dart::Color::Orange());

	}
}
#include <iostream>
#include <dart/dart.hpp>
#include <dart/gui/gui.hpp>
#include <dart/utils/utils.hpp>
#include "SkelParser.hpp"

SkelParser::SkelParser(){}
SkelParser::~SkelParser(){}

//WeldJoint Overriding with different parameters
BodyNode*
SkelParser::weldBox
(const SkeletonPtr& skel, const std::string& name, 
	const Eigen::Vector3d boxsize, const Eigen::Vector3d offChild, double mass, const Eigen::Vector3d color)
{
	//Shape
	ShapePtr shape = std::shared_ptr<BoxShape>(new BoxShape(boxsize));

	//Inertia
	dart::dynamics::Inertia inertia;
	inertia.setMass(mass);
	inertia.setMoment(shape->computeInertia(mass));

	//Joint Parsing
	BodyNode* bn;
	WeldJoint::Properties props;
	props.mName = name;

	Eigen::Isometry3d T1;
	T1.setIdentity();	
	T1.translation() = offChild;
	props.mT_ChildBodyToJoint = T1;

	bn = skel->createJointAndBodyNodePair<WeldJoint>(nullptr, props,BodyNode::AspectProperties(name)).second;
	bn->createShapeNodeWith<VisualAspect,CollisionAspect,DynamicsAspect>(shape);
	auto visualShapenodes = bn->getShapeNodesWith<VisualAspect>();
	visualShapenodes[0]->getVisualAspect()->setColor(color);
	bn->setInertia(inertia);	
	return bn;
}

BodyNode* 
SkelParser::weldBox
(const SkeletonPtr& skel, BodyNode* parent, const std::string& name, const Eigen::Vector3d boxsize, 
	const Eigen::Vector3d offChild, const Eigen::Vector3d offParent, double mass, const Eigen::Vector3d color)
{
	//Shape
	ShapePtr shape = std::shared_ptr<BoxShape>(new BoxShape(boxsize));

	//Inertia
	dart::dynamics::Inertia inertia;
	inertia.setMass(mass);
	inertia.setMoment(shape->computeInertia(mass));

	//Joint Parsing
	BodyNode* bn;
	WeldJoint::Properties props;
	props.mName = name;

	Eigen::Isometry3d T1;
	T1.setIdentity();	
	T1.translation() = offChild;
	props.mT_ChildBodyToJoint = T1;

	Eigen::Isometry3d T2;
	T2.setIdentity();
	T2.translation() = offParent;
	props.mT_ParentBodyToJoint = T2;

	bn = skel->createJointAndBodyNodePair<WeldJoint>(parent,props,BodyNode::AspectProperties(name)).second;
	bn->createShapeNodeWith<VisualAspect,CollisionAspect,DynamicsAspect>(shape);
	auto visualShapenodes = bn->getShapeNodesWith<VisualAspect>();
	visualShapenodes[0]->getVisualAspect()->setColor(color);
	bn->setInertia(inertia);	
	return bn;
}

//BallJoint Overriding with different parameters

BodyNode* 
SkelParser::ballBox
(const SkeletonPtr& skel, BodyNode* parent, const std::string& name, const Eigen::Vector3d boxsize, 
	const Eigen::Vector3d offChild, const Eigen::Vector3d offParent, double mass, const Eigen::Vector3d color)
{
	//Shape
	ShapePtr shape = std::shared_ptr<BoxShape>(new BoxShape(boxsize));

	//Inertia
	dart::dynamics::Inertia inertia;
	inertia.setMass(mass);
	inertia.setMoment(shape->computeInertia(mass));

	//Joint Parsing
	BodyNode* bn;
	BallJoint::Properties props;
	props.mName = name;
	props.mDampingCoefficients = Eigen::Vector3d::Constant(0.2);

	Eigen::Isometry3d T1;
	T1.setIdentity();	
	T1.translation() = offChild;
	props.mT_ChildBodyToJoint = T1;

	Eigen::Isometry3d T2;
	T2.setIdentity();
	T2.translation() = offParent;
	props.mT_ParentBodyToJoint = T2;

	bn = skel->createJointAndBodyNodePair<BallJoint>(parent,props,BodyNode::AspectProperties(name)).second;
	bn->createShapeNodeWith<VisualAspect,CollisionAspect,DynamicsAspect>(shape);
	auto visualShapenodes = bn->getShapeNodesWith<VisualAspect>();
	visualShapenodes[0]->getVisualAspect()->setColor(color);
	bn->setInertia(inertia);	
	return bn;
}

BodyNode*
SkelParser::ballCylinder
(const SkeletonPtr &skel, BodyNode *parent, const std::string &name, double rad, double height, 
	const Eigen::Vector3d offChild, const Eigen::Vector3d offParent, double mass, const Eigen::Vector3d color)
{
	//Shape
	ShapePtr shape = std::shared_ptr<CylinderShape>(new CylinderShape(rad,height));

	//Inertia
	dart::dynamics::Inertia inertia;
	inertia.setMass(mass);
	inertia.setMoment(shape->computeInertia(mass));

	//Joint Parsing
	BodyNode* bn;
	BallJoint::Properties props;
	props.mName = name;
	props.mDampingCoefficients = Eigen::Vector3d::Constant(0.2);

	Eigen::Isometry3d T1;
	T1.setIdentity();	
	T1.translation() = offChild;
	props.mT_ChildBodyToJoint = T1;

	Eigen::Isometry3d T2;
	T2.setIdentity();
	T2.translation() = offParent;
	props.mT_ParentBodyToJoint = T2;

	bn = skel->createJointAndBodyNodePair<BallJoint>(parent,props,BodyNode::AspectProperties(name)).second;
	bn->createShapeNodeWith<VisualAspect,CollisionAspect,DynamicsAspect>(shape);
	auto visualShapenodes = bn->getShapeNodesWith<VisualAspect>();
	visualShapenodes[0]->getVisualAspect()->setColor(color);
	bn->setInertia(inertia);	
	return bn;
}

BodyNode* 
SkelParser::ballEllipsoid
(const SkeletonPtr& skel, BodyNode* parent, const std::string& name, const Eigen::Vector3d ellipsoidsize, 
	const Eigen::Vector3d offChild, const Eigen::Vector3d offParent, double mass, const Eigen::Vector3d color)
{
	//Shape
	ShapePtr shape = std::shared_ptr<EllipsoidShape>(new EllipsoidShape(ellipsoidsize));

	//Inertia
	dart::dynamics::Inertia inertia;
	inertia.setMass(mass);
	inertia.setMoment(shape->computeInertia(mass));

	//Joint Parsing
	BodyNode* bn;
	BallJoint::Properties props;
	props.mName = name;
	props.mDampingCoefficients = Eigen::Vector3d::Constant(0.2);


	Eigen::Isometry3d T1;
	T1.setIdentity();	
	T1.translation() = offChild;
	props.mT_ChildBodyToJoint = T1;

	Eigen::Isometry3d T2;
	T2.setIdentity();
	T2.translation() = offParent;
	props.mT_ParentBodyToJoint = T2;

	bn = skel->createJointAndBodyNodePair<BallJoint>(parent,props,BodyNode::AspectProperties(name)).second;
	bn->createShapeNodeWith<VisualAspect,CollisionAspect,DynamicsAspect>(shape);
	auto visualShapenodes = bn->getShapeNodesWith<VisualAspect>();
	visualShapenodes[0]->getVisualAspect()->setColor(color);
	bn->setInertia(inertia);	
	return bn;
}



BodyNode* 
SkelParser::univBox
(const SkeletonPtr& skel, BodyNode* parent, const std::string& name, const Eigen::Vector3d axis1, 
	const Eigen::Vector3d axis2, const Eigen::Vector3d boxsize, const Eigen::Vector3d offChild,
	const Eigen::Vector3d offParent, double mass, const Eigen::Vector3d color)
{
	//Shape
	ShapePtr shape = std::shared_ptr<BoxShape>(new BoxShape(boxsize));

	//Inertia
	dart::dynamics::Inertia inertia;
	inertia.setMass(mass);
	inertia.setMoment(shape->computeInertia(mass));

	//Joint Parsing
	BodyNode* bn;
	UniversalJoint::Properties props;
	props.mName = name;
	props.mAxis[0] = axis1;
	props.mAxis[1] = axis2;

	Eigen::Isometry3d T1;
	T1.setIdentity();	
	T1.translation() = offChild;
	props.mT_ChildBodyToJoint = T1;

	Eigen::Isometry3d T2;
	T2.setIdentity();
	T2.translation() = offParent;
	props.mT_ParentBodyToJoint = T2;

	bn = skel->createJointAndBodyNodePair<UniversalJoint>(parent,props,BodyNode::AspectProperties(name)).second;
	bn->createShapeNodeWith<VisualAspect,CollisionAspect,DynamicsAspect>(shape);
	auto visualShapenodes = bn->getShapeNodesWith<VisualAspect>();
	visualShapenodes[0]->getVisualAspect()->setColor(color);
	bn->setInertia(inertia);	
	return bn;
}

BodyNode*
SkelParser::univCylinder
(const SkeletonPtr &skel, BodyNode *parent, const std::string &name, const Eigen::Vector3d axis1, 
	const Eigen::Vector3d axis2, double rad, double height, const Eigen::Vector3d offChild, 
	const Eigen::Vector3d offParent, double mass, const Eigen::Vector3d color)
{
	//Shape
	ShapePtr shape = std::shared_ptr<CylinderShape>(new CylinderShape(rad,height));

	//Inertia
	dart::dynamics::Inertia inertia;
	inertia.setMass(mass);
	inertia.setMoment(shape->computeInertia(mass));

	//Joint Parsing
	BodyNode* bn;
	UniversalJoint::Properties props;
	props.mName = name;
	props.mAxis[0] = axis1;
	props.mAxis[1] = axis2;

	Eigen::Isometry3d T1;
	T1.setIdentity();	
	T1.translation() = offChild;
	props.mT_ChildBodyToJoint = T1;

	Eigen::Isometry3d T2;
	T2.setIdentity();
	T2.translation() = offParent;
	props.mT_ParentBodyToJoint = T2;

	bn = skel->createJointAndBodyNodePair<UniversalJoint>(parent,props,BodyNode::AspectProperties(name)).second;
	bn->createShapeNodeWith<VisualAspect,CollisionAspect,DynamicsAspect>(shape);
	auto visualShapenodes = bn->getShapeNodesWith<VisualAspect>();
	visualShapenodes[0]->getVisualAspect()->setColor(color);
	bn->setInertia(inertia);	
	return bn;
}

BodyNode* 
SkelParser::univEllipsoid
(const SkeletonPtr& skel, BodyNode* parent, const std::string& name, const Eigen::Vector3d axis1, 
	const Eigen::Vector3d axis2, const Eigen::Vector3d ellipsoidsize, const Eigen::Vector3d offChild,
	const Eigen::Vector3d offParent, double mass, const Eigen::Vector3d color)
{
	//Shape
	ShapePtr shape = std::shared_ptr<EllipsoidShape>(new EllipsoidShape(ellipsoidsize));

	//Inertia
	dart::dynamics::Inertia inertia;
	inertia.setMass(mass);
	inertia.setMoment(shape->computeInertia(mass));

	//Joint Parsing
	BodyNode* bn;
	UniversalJoint::Properties props;
	props.mName = name;
	props.mAxis[0] = axis1;
	props.mAxis[1] = axis2;


	Eigen::Isometry3d T1;
	T1.setIdentity();	
	T1.translation() = offChild;
	props.mT_ChildBodyToJoint = T1;

	Eigen::Isometry3d T2;
	T2.setIdentity();
	T2.translation() = offParent;
	props.mT_ParentBodyToJoint = T2;

	bn = skel->createJointAndBodyNodePair<UniversalJoint>(parent,props,BodyNode::AspectProperties(name)).second;
	bn->createShapeNodeWith<VisualAspect,CollisionAspect,DynamicsAspect>(shape);
	auto visualShapenodes = bn->getShapeNodesWith<VisualAspect>();
	visualShapenodes[0]->getVisualAspect()->setColor(color);
	bn->setInertia(inertia);	
	return bn;
}

BodyNode* 
SkelParser::revolBox
(const SkeletonPtr& skel, BodyNode* parent, const std::string& name, const Eigen::Vector3d axis,
	const Eigen::Vector3d boxsize, const Eigen::Vector3d offChild,
	const Eigen::Vector3d offParent, double mass, const Eigen::Vector3d color)
{
	//Shape
	ShapePtr shape = std::shared_ptr<BoxShape>(new BoxShape(boxsize));

	//Inertia
	dart::dynamics::Inertia inertia;
	inertia.setMass(mass);
	inertia.setMoment(shape->computeInertia(mass));

	//Joint Parsing
	BodyNode* bn;
	RevoluteJoint::Properties props;
	props.mName = name;
	props.mAxis = axis;

	Eigen::Isometry3d T1;
	T1.setIdentity();	
	T1.translation() = offChild;
	props.mT_ChildBodyToJoint = T1;

	Eigen::Isometry3d T2;
	T2.setIdentity();
	T2.translation() = offParent;
	props.mT_ParentBodyToJoint = T2;

	bn = skel->createJointAndBodyNodePair<RevoluteJoint>(parent,props,BodyNode::AspectProperties(name)).second;
	bn->createShapeNodeWith<VisualAspect,CollisionAspect,DynamicsAspect>(shape);
	auto visualShapenodes = bn->getShapeNodesWith<VisualAspect>();
	visualShapenodes[0]->getVisualAspect()->setColor(color);
	bn->setInertia(inertia);	
	return bn;
}

BodyNode*
SkelParser::revolCylinder
(const SkeletonPtr &skel, BodyNode *parent, const std::string &name, const Eigen::Vector3d axis, 
	double rad, double height, const Eigen::Vector3d offChild, 
	const Eigen::Vector3d offParent, double mass, const Eigen::Vector3d color)
{
	//Shape
	ShapePtr shape = std::shared_ptr<CylinderShape>(new CylinderShape(rad,height));

	//Inertia
	dart::dynamics::Inertia inertia;
	inertia.setMass(mass);
	inertia.setMoment(shape->computeInertia(mass));

	//Joint Parsing
	BodyNode* bn;
	RevoluteJoint::Properties props;
	props.mName = name;
	props.mAxis = axis;

	Eigen::Isometry3d T1;
	T1.setIdentity();	
	T1.translation() = offChild;
	props.mT_ChildBodyToJoint = T1;

	Eigen::Isometry3d T2;
	T2.setIdentity();
	T2.translation() = offParent;
	props.mT_ParentBodyToJoint = T2;

	bn = skel->createJointAndBodyNodePair<RevoluteJoint>(parent,props,BodyNode::AspectProperties(name)).second;
	bn->createShapeNodeWith<VisualAspect,CollisionAspect,DynamicsAspect>(shape);
	auto visualShapenodes = bn->getShapeNodesWith<VisualAspect>();
	visualShapenodes[0]->getVisualAspect()->setColor(color);
	bn->setInertia(inertia);	
	return bn;
}

BodyNode* 
SkelParser::revolEllipsoid
(const SkeletonPtr& skel, BodyNode* parent, const std::string& name, const Eigen::Vector3d axis, 
	const Eigen::Vector3d ellipsoidsize, const Eigen::Vector3d offChild,
	const Eigen::Vector3d offParent, double mass, const Eigen::Vector3d color)
{
	//Shape
	ShapePtr shape = std::shared_ptr<EllipsoidShape>(new EllipsoidShape(ellipsoidsize));

	//Inertia
	dart::dynamics::Inertia inertia;
	inertia.setMass(mass);
	inertia.setMoment(shape->computeInertia(mass));

	//Joint Parsing
	BodyNode* bn;
	RevoluteJoint::Properties props;
	props.mName = name;
	props.mAxis = axis;


	Eigen::Isometry3d T1;
	T1.setIdentity();	
	T1.translation() = offChild;
	props.mT_ChildBodyToJoint = T1;

	Eigen::Isometry3d T2;
	T2.setIdentity();
	T2.translation() = offParent;
	props.mT_ParentBodyToJoint = T2;

	bn = skel->createJointAndBodyNodePair<RevoluteJoint>(parent,props,BodyNode::AspectProperties(name)).second;
	bn->createShapeNodeWith<VisualAspect,CollisionAspect,DynamicsAspect>(shape);
	auto visualShapenodes = bn->getShapeNodesWith<VisualAspect>();
	visualShapenodes[0]->getVisualAspect()->setColor(color);
	bn->setInertia(inertia);	
	return bn;
}
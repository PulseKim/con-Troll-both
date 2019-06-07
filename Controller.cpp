#include "Controller.h"

const double rad = M_PI /180.0;

Controller::Controller(const SkeletonPtr& finger): mFinger(finger)
{
    jointControlSetter();
}

void Controller::jointControlSetter()
{
	int nDofs = mFinger->getNumDofs();

    int mag_Kp[] ={1000, 1000, 1000, 500, 500, 500, 50, 50,50, 40, 30, 50, 50, 40, 30, 50, 50, 40, 30, 50, 50, 40, 30, 50, 50, 40, 30};

	mForces = Eigen::VectorXd::Zero(nDofs);
    mKp = Eigen::MatrixXd::Identity(nDofs, nDofs);
    mKd = Eigen::MatrixXd::Identity(nDofs, nDofs);

    for(std::size_t i = 0; i < nDofs; ++i){
      mKp(i,i) = mag_Kp[i];
      mKd(i,i) = 2 * std::sqrt(mag_Kp[i]);
    }
  Controller::setTargetPosition(mFinger->getPositions());
}

void Controller::setTargetPosition(const Eigen::VectorXd& pose)
{
	mTargetPositions = pose;
}

void Controller::clearForces()
{
	mForces.setZero();
}


void Controller::addSPDForces()
{
	Eigen::VectorXd q = mFinger->getPositions();
    Eigen::VectorXd dq = mFinger->getVelocities();
    for(int i = 0; i < q.size(); ++i){
        if(q[i]-mTargetPositions[i] > M_PI) q[i]-=2*M_PI;
        else if(q[i]-mTargetPositions[i] < -M_PI) q[i]+=2*M_PI;
    }

    Eigen::MatrixXd invM = (mFinger->getMassMatrix()
        + mKd * mFinger->getTimeStep()).inverse();
    Eigen::VectorXd p =
    -mKp * (q + dq * mFinger->getTimeStep() - mTargetPositions);
    Eigen::VectorXd d = -mKd * dq;
    Eigen::VectorXd qddot =
    invM * (-mFinger->getCoriolisAndGravityForces()
        + p + d + mFinger->getConstraintForces());
    
    mForces += p + d - mKd * qddot * mFinger->getTimeStep();
    mFinger->setForces(mForces);
}

void Controller::addPDForces()
{
    Eigen::VectorXd q = mFinger->getPositions();
    Eigen::VectorXd dq = mFinger->getVelocities();
    for(int i = 0; i < q.size(); ++i){
        if(q[i]-mTargetPositions[i] > M_PI) q[i]-=2*M_PI;
        else if(q[i]-mTargetPositions[i] < -M_PI) q[i]+=2*M_PI;
    }
    // std::cout << "q" << q.transpose() <<std::endl;

    Eigen::VectorXd p = -mKp * (q - mTargetPositions);
    Eigen::VectorXd d = -mKd * dq;

    mForces += p+d;
    // std::cout <<"p" << p.transpose() <<std::endl;
    // std::cout << "d"  << d.transpose() << std::endl;
    mFinger->setForces(mForces);
}
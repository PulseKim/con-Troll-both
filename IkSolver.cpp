#include "IkSolver.hpp"

IkSolver::IkSolver(){

}


Eigen::VectorXd IkSolver::IKMultiple
(const SkeletonPtr& hand, std::vector<std::pair<Eigen::Vector3d, int>> Ends, int total_iter)
{
	SkeletonPtr dummyHand = hand->cloneSkeleton();
	for(int i = 0; i < Ends.size(); ++i){
		std::cout << "current" <<std::endl;
		std::cout << dummyHand->getBodyNode("patch" + std::to_string(Ends[i].second))->getCOM().transpose()<<std::endl;	Eigen::MatrixXd J_stack = Eigen::MatrixXd::Zero(Ends[0].first.rows()*Ends.size(),hand->getPositions().size());
	}

	Eigen::MatrixXd J_stack = Eigen::MatrixXd::Zero(Ends[0].first.rows()*Ends.size(),hand->getPositions().size());
	Eigen::VectorXd dev_stack;
	dev_stack = Eigen::VectorXd::Zero(Ends.size()*3); 
	Eigen::VectorXd newPose;
	double epsilon = 0.0001;

	for(int current_iter = 0; current_iter < total_iter ;current_iter++)
	{
		Eigen::VectorXd currentPose = dummyHand->getPositions();
		double total_dev = 0;
		for(int i = 0 ; i < Ends.size() ; i ++){
			BodyNode* currentFinger;
			if(Ends[i].second !=4) currentFinger = dummyHand->getBodyNode("patch" + std::to_string(Ends[i].second));
			else currentFinger = dummyHand->getBodyNode("thumbpatch");
			Eigen::Vector3d deviation = Ends[i].first - currentFinger->getCOM();
			total_dev += deviation.norm();
			Eigen::MatrixXd J = dummyHand->getLinearJacobian(currentFinger);
			//Weight Parameterize for arm and palm
			for(int i = 0; i <6 ; ++i){
				J.col(i) *=2;
				// J.col(i) = J.col(i) * (2 *(current_iter+2)/total_iter);
			}

			// //Weight Parameterize for fingers
			// for(int i = 0; i <5 ; ++i){
			// 	for(int j = 0; j <4; ++j)
			// 		J.col(4*i+6+j) = J.col(4*i+6+j) * (2 * (total_iter-current_iter+2)/total_iter);
			// }

			J.col(dummyHand->getPositions().size()-1) = J.col(dummyHand->getPositions().size()-1) * (2.3*(total_iter-current_iter+2)/total_iter);

			J_stack.block(J.rows()*i,0,J.rows(),J.cols()) = J;
			dev_stack(3*i) = deviation[0];
			dev_stack(3*i+1) = deviation[1];
			dev_stack(3*i+2) = deviation[2];
		}
		Eigen::MatrixXd JJT = J_stack*J_stack.transpose();
		Eigen::MatrixXd pseudoJ = J_stack.transpose() * (JJT+ 0.0025 * Eigen::MatrixXd::Identity(JJT.rows(), JJT.cols())).inverse();

		Eigen::VectorXd tempPose = pseudoJ * dev_stack * 0.1;
		dummyHand->setPositions(currentPose+tempPose);
		if(total_dev < epsilon) break;
	}
	newPose = dummyHand->getPositions();
	std::cout << "setting pose" <<std::endl;
	for(int i = 0; i < Ends.size(); ++i)
		std::cout << dummyHand->getBodyNode("patch" + std::to_string(Ends[i].second))->getCOM().transpose()<<std::endl;
	return newPose;
}

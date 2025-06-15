# devops-training
This repo will be jused for training purpose







✅ Should you define subnet ranges in both vpc/variables.tf and root variables.tf?
Yes, you typically define the subnet ranges in the root variables.tf file, and then pass them as inputs to the VPC module. You do not need to redefine them inside the module—only declare them there.

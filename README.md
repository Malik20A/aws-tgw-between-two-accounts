# aws-tgw-between-two-accounts

In your AWS credentials file .aws/credentials, create two named profiles for the two accounts with their respective access keys and secret keys.

In the config file ./aws/config, you should define the profile settings for each user with the desired region and output format. Since both users are in the same AWS account, you can use the same settings for both profiles.
plan:
	cd environments/$(env) && terraform plan

apply:
	cd environments/$(env) && terraform apply -auto-approve
	
destroy:
	cd environments/$(env) && terraform destroy
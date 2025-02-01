## up: starts all containers in the background without forcing build
up:
	@echo "Starting Docker containers..."
	docker-compose up -d
	@echo "Docker containers started!"

## down: stop docker compose
down:
	@echo "Stopping docker compose..."
	docker-compose down
	@echo "Done!"



#------------------------------------------------------------------------------#
#								   GENERAL									   #
#------------------------------------------------------------------------------#

RM = sudo rm -rf
DC = docker compose

IMAGES = $(shell docker images -q)
CONTAINERS = $(shell docker ps -aq)
NETWORK = srcs_inception
VOLUMES = $(shell docker volume ls --quiet)

RM_IMAGES = docker image rm $(IMAGES)
RM_CONT = docker rm -f $(CONTAINERS)
RM_VOL = docker volume rm -f $(VOLUMES)
RM_NET = docker network rm $(NETWORK)

#------------------------------------------------------------------------------#
#								   NEEDED								   #
#------------------------------------------------------------------------------#

D_MDB = /home/ewurstei/data/mariadb
D_WP = /home/ewurstei/data/wordpress

#------------------------------------------------------------------------------#
#									SOURCES									   #
#------------------------------------------------------------------------------#

SRCS =	srcs/docker-compose.yml
LOG = docker_logs.log
BLOG = docker_build_logs.log

#------------------------------------------------------------------------------#
#									 RULES									   #
#------------------------------------------------------------------------------#

all:	docker
	@echo "$(LGREEN)Logs available. You can follow the containers readiness with command "make logs"$(NC)"

docker:	$(SRCS)
	@sudo mkdir -p $(D_MDB)
	@sudo mkdir -p $(D_WP)
	@echo "$(LGREEN)Directories Creation Completed.$(NC)"
	@$(call creating, $(DC) -f $(SRCS) up --build --remove-orphans -d) &> $(BLOG)

logs:
	@$(DC) -f $(SRCS) logs --follow > $(LOG)

copy:
	@ssh ewurstei@10.211.55.3 "if [ ! -d '/home/ewurstei/Documents/42/' ]; then mkdir '/home/ewurstei/Documents/42/' && echo -e '$(LGREEN)42 directory in VM created.$(NC)'; fi"
	@scp Makefile ewurstei@10.211.55.3:/home/ewurstei/Documents/42/
	@scp -r srcs/ ewurstei@10.211.55.3:/home/ewurstei/Documents/42/

env:
	@bash srcs/env-param.sh

clean:
	@$(call cleaning, $(DC) -f $(SRCS) stop)
	@echo "$(LGREEN)Docker Containers Stopped.$(NC)"

fclean:	clean
	@$(RM) $(D_MDB)
	@$(RM) $(D_WP)
	@echo "$(LGREEN)Directories Removal Completed.$(NC)"
	@$(call fcleaning, $(DC) -f $(SRCS) down)
	@echo "$(LGREEN)Docker Containers and Network Removed.$(NC)"
	@if [ -n "$(IMAGES)" ]; then $(RM_IMAGES); echo "$(LGREEN)Docker Images Removed.$(NC)"; fi
	@if [ -n "$(VOLUMES)" ]; then $(RM_VOL); echo "$(LGREEN)Docker Volumes Removed.$(NC)"; fi
	@$(RM) *.log

re:	fclean all

.PHONY: all clean fclean re logs copy env

#------------------------------------------------------------------------------#
#								  MAKEUP RULES								   #
#------------------------------------------------------------------------------#

#----------------------------------- COLORS -----------------------------------#
LRED = \033[91m
RED = \033[91m
LGREEN = \033[92m
LYELLOW = \033[93m
LMAGENTA = \033[95m
LCYAN = \033[96m
NC = \033[0;39m

#----------------------------------- TEXTES -----------------------------------#
OK_STRING = "[OK]"
ERROR_STRING = "[ERROR]"
WARN_STRING = "[WARNING]"
COMP_STRING = "Generating"
CLEAN_STRING = "Cleaning"
CREAT_STRING = "Creating"

#----------------------------------- DEFINE -----------------------------------#
define run_and_test
printf "%b" "$(LCYAN)$(COMP_STRING)$(LMAGENTA) $(@F)$(NC)\r"; \
$(1) 2> $@.log; \
RESULT=$$?; \
	if [ $$RESULT -ne 0 ]; then \
		printf "%-60b%b" "$(LCYAN)$(COMP_STRING)$(LMAGENTA) $(@F)" "💥$(NC)\n"; \
	elif [ -s $@.log ]; then \
		printf "%-60b%b" "$(LCYAN)$(COMP_STRING)$(LMAGENTA) $(@F)" "⚠️$(NC)\n"; \
	else \
		printf "%-60b%b" "$(LCYAN)$(COMP_STRING)$(LMAGENTA) $(@F)" "✅$(NC)\n"; \
	fi; \
	cat $@.log; \
	rm -f $@.log; \
	exit $$RESULT
endef

define cleaning
printf "%b" "$(LCYAN)$(CLEAN_STRING)$(LMAGENTA) STOPPING containers$(NC)\r"; \
$(1) 2> $@.log; \
RESULT=$$?; \
	if [ $$RESULT -ne 0 ]; then \
		printf "%-60b%b" "$(LCYAN)$(CLEAN_STRING)$(LMAGENTA) STOPPING containers" "💥$(NC)\n"; \
	elif [ -s $@.log ]; then \
		printf "%-60b%b" "$(LCYAN)$(CLEAN_STRING)$(LMAGENTA) STOPPING containers" "⚠️$(NC)\n"; \
	else \
		printf "%-60b%b" "$(LCYAN)$(CLEAN_STRING)$(LMAGENTA) STOPPING containers" "✅$(NC)\n"; \
	fi; \
	cat $@.log; \
	rm -f $@.log; \
	exit $$RESULT
endef

define fcleaning
printf "%b" "$(LCYAN)$(CLEAN_STRING)$(LMAGENTA) REMOVING containers, volumes, images and network$(NC)\r"; \
$(1) 2> $@.log; \
RESULT=$$?; \
	if [ $$RESULT -ne 0 ]; then \
		printf "%-60b%b" "$(LCYAN)$(CLEAN_STRING)$(LMAGENTA) REMOVING containers, volumes, images and Network" "💥$(NC)\n"; \
	elif [ -s $@.log ]; then \
		printf "%-60b%b" "$(LCYAN)$(CLEAN_STRING)$(LMAGENTA) REMOVING containers, volumes, images and Network" "⚠️$(NC)\n"; \
	else \
		printf "%-60b%b" "$(LCYAN)$(CLEAN_STRING)$(LMAGENTA) REMOVING containers, volumes, images and Network" "✅$(NC)\n"; \
	fi; \
	cat $@.log; \
	rm -f $@.log; \
	exit $$RESULT
endef

define creating
printf "%b" "$(LCYAN)$(CREAT_STRING)$(LMAGENTA) $(@F)$(NC)\r"; \
$(1) 2> $@.log; \
RESULT=$$?; \
	if [ $$RESULT -ne 0 ]; then \
		printf "%-60b%b" "$(LCYAN)$(CREAT_STRING)$(LMAGENTA) $(@F)" "💥$(NC)\n"; \
	elif [ -s $@.log ]; then \
		printf "%-60b%b" "$(LCYAN)$(CREAT_STRING)$(LMAGENTA) $(@F)" "⚠️$(NC)\n"; \
	else \
		printf "%-60b%b" "$(LCYAN)$(CREAT_STRING)$(LMAGENTA) $(@F)" "✅$(NC)\n"; \
	fi; \
	cat $@.log; \
	rm -f $@.log; \
	exit $$RESULT
endef
#------------------------------------------------------------------------------#
#								   GENERAL									   #
#------------------------------------------------------------------------------#

RM = sudo rm -rf
DC = docker compose

#------------------------------------------------------------------------------#
#								   NEEDED								   #
#------------------------------------------------------------------------------#

D_MDB = /home/ewurstei/data/mariadb
D_WP = /home/ewurstei/data/wordpress
D_NGINX = /home/ewurstei/data/nginx

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
	@echo "$(LGREEN)Logs available.$(NC)"

docker:	$(SRCS)
	@sudo mkdir -p $(D_MDB)
	@sudo mkdir -p $(D_WP)
	@sudo mkdir -p $(D_NGINX)
	@echo "$(LGREEN)Directories Creation Completed.$(NC)"
	@$(call creating, $(DC) -f $(SRCS) up --build --remove-orphans -d) &> $(BLOG)

logs:
	@$(DC) -f $(SRCS) logs > $(LOG)

clean:
	@$(call cleaning, $(DC) -f $(SRCS) stop)
	@echo "$(LGREEN)Docker Containers Stopped.$(NC)"

fclean:	clean
	@$(RM) $(D_MDB)
	@$(RM) $(D_WP)
	@$(RM) $(D_NGINX)
	@echo "$(LGREEN)Directories Removal Completed.$(NC)"
	@$(call fcleaning, $(DC) -f $(SRCS) down)
	@echo "$(LGREEN)Docker Containers Removed.$(NC)"

re:	fclean all

.PHONY: all clean fclean re logs

#------------------------------------------------------------------------------#
#								  MAKEUP RULES								   #
#------------------------------------------------------------------------------#

#----------------------------------- COLORS -----------------------------------#
LRED = \033[91m
RED = \033[91m
LGREEN = \033[92m
LYELLOW = \033[93
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
printf "%b" "$(LCYAN)$(CLEAN_STRING)$(LMAGENTA) OBJECT Files$(NC)\r"; \
$(1) 2> $@.log; \
RESULT=$$?; \
	if [ $$RESULT -ne 0 ]; then \
		printf "%-60b%b" "$(LCYAN)$(CLEAN_STRING)$(LMAGENTA) OBJECT Files" "💥$(NC)\n"; \
	elif [ -s $@.log ]; then \
		printf "%-60b%b" "$(LCYAN)$(CLEAN_STRING)$(LMAGENTA) OBJECT Files" "⚠️$(NC)\n"; \
	else \
		printf "%-60b%b" "$(LCYAN)$(CLEAN_STRING)$(LMAGENTA) OBJECT Files" "✅$(NC)\n"; \
	fi; \
	cat $@.log; \
	rm -f $@.log; \
	exit $$RESULT
endef

define fcleaning
printf "%b" "$(LCYAN)$(CLEAN_STRING)$(LMAGENTA) PROJECT Executable Files$(NC)\r"; \
$(1) 2> $@.log; \
RESULT=$$?; \
	if [ $$RESULT -ne 0 ]; then \
		printf "%-60b%b" "$(LCYAN)$(CLEAN_STRING)$(LMAGENTA) PROJECT Executable Files" "💥$(NC)\n"; \
	elif [ -s $@.log ]; then \
		printf "%-60b%b" "$(LCYAN)$(CLEAN_STRING)$(LMAGENTA) PROJECT Executable Files" "⚠️$(NC)\n"; \
	else \
		printf "%-60b%b" "$(LCYAN)$(CLEAN_STRING)$(LMAGENTA) PROJECT Executable Files" "✅$(NC)\n"; \
	fi; \
	cat $@.log; \
	rm -f $@.log; \
	exit $$RESULT
endef

define lcleaning
printf "%b" "$(LCYAN)$(CLEAN_STRING)$(LMAGENTA) LIBRARY Files$(NC)\r"; \
$(1) 2> $@.log; \
RESULT=$$?; \
	if [ $$RESULT -ne 0 ]; then \
		printf "%-60b%b" "$(LCYAN)$(CLEAN_STRING)$(LMAGENTA) LIBRARIES Files" "💥$(NC)\n"; \
	elif [ -s $@.log ]; then \
		printf "%-60b%b" "$(LCYAN)$(CLEAN_STRING)$(LMAGENTA) LIBRARIES Files" "⚠️$(NC)\n"; \
	else \
		printf "%-60b%b" "$(LCYAN)$(CLEAN_STRING)$(LMAGENTA) LIBRARIES Files" "✅$(NC)\n"; \
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
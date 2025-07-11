VENV_DIR = ./.venv

# Check if the virtual environment is activated
CHECK_VENV = [ -n "$$VIRTUAL_ENV" ] || exit 1

MAKEFLAGS += --no-print-directory

# Venv Setup
venv/create:
	python3 -m venv $(VENV_DIR)
	. $(VENV_DIR)/bin/activate && pip install awscli-local[ver1]
	@echo "\nAmbiente virtual criado em $(VENV_DIR)"
	@echo "Para ativar o ambiente virtual, execute:"
	@echo "source $(VENV_DIR)/bin/activate"

venv/clean:
	rm -rf $(VENV_DIR)
	@echo "Ambiente virtual removido: $(VENV_DIR)"
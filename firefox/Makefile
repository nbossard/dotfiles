.PHONY: all clean install

BUILD_DIR := build

all: user.js

# Étape 1 : extraire les URLs (sans commentaires ni lignes vides)
$(BUILD_DIR)/homepage_urls.filtered.txt: homepage_urls.txt
	mkdir -p $(BUILD_DIR)
	grep -v '^#' $< | grep -v '^$$' > $@

# Étape 2 : joindre les URLs avec | (séparateur Firefox) et supprimer le | final
$(BUILD_DIR)/homepage_urls.joined.txt: $(BUILD_DIR)/homepage_urls.filtered.txt
	tr '\n' '|' < $< | sed 's/|$$//' > $@

# Étape 3 : injecter les URLs dans le template à la place de %%HOMEPAGE%%
# Note: python3 est utilisé ici car sed et awk ont des problèmes avec les
#       caractères spéciaux présents dans les URLs (/, &, #!) qui sont
#       interprétés comme des métacaractères dans ces outils.
user.js: user.js.template $(BUILD_DIR)/homepage_urls.joined.txt
	python3 -c \
		"import sys; tpl=open(sys.argv[1]).read(); urls=open(sys.argv[2]).read().strip(); print(tpl.replace('%%HOMEPAGE%%', urls), end='')" \
		$< $(BUILD_DIR)/homepage_urls.joined.txt > $@

# Crée (ou recrée) le symlink vers le profil Firefox actif
install: user.js
	ln -sf "$(shell pwd)/user.js" \
		"$(HOME)/Library/Application Support/Firefox/Profiles/dtihh7z6.default-release/user.js"

clean:
	rm -rf $(BUILD_DIR) user.js

# Makefile to generate file with key from file without key, to prevent commit keys

config.yaml: config_without_key.yaml
	# replace __OPENAI_API_KEY__ marker by content of key: OPENAI_API_KEY defined in ../AI_API_KEYS.sh
	source ../AI_API_KEYS.sh && sed "s/__OPENAI_API_KEY__/$$OPENAI_API_KEY/" config_without_key.yaml > config.yaml
	# Add a line of warnings DO NOT EDIT THIS FILE
	echo '# ⚠️⚠️⚠️ WARNING: DO NOT EDIT THIS FILE DIRECTLY - IT IS GENERATED FROM config_without_key.yaml ⚠️⚠️⚠️' > config.yaml.tmp
	cat config.yaml >> config.yaml.tmp
	mv config.yaml.tmp config.yaml
	# Make the file read-only for all users
	chmod a=r config.yaml

clean:
	rm config.yaml

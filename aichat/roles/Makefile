analyse_mr_go.md: analyse_mr.md analyse_mr_addon_go.md
	touch $@
	chmod a+w $@
	cat analyse_mr.md > $@
	cat analyse_mr_addon_go.md >> $@
	chmod a-w $@

%_quickfix.md: %.md
	cat $< > $@
	cat quickfix_addon.md >> $@

all: analyse_commit.md \
	analyse_mr.md \
	analyse_mr_go.md \
	analyse_mr_addon_go.md \
	analyse_mr_quickfix.md

clean:
	rm analyse_mr_go.md
	rm analyse_mr_quickfix.md

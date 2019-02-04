MIRROR_FROM_REP_DIR = lib/import/import-libspng.mk lib/mk/libspng.mk

content: $(MIRROR_FROM_REP_DIR) src/lib/libspng/target.mk LICENSE

$(MIRROR_FROM_REP_DIR):
	$(mirror_from_rep_dir)

PORT_DIR := $(call port_dir,$(REP_DIR)/ports/libspng)

src/lib/libspng/target.mk:
	mkdir -p src/lib/libspng
	cp -r $(PORT_DIR)/src/lib/libspng/* src/lib/libspng
	echo "LIBS := libspng" > $@

LICENSE:
	cp $(PORT_DIR)/src/lib/libspng/LICENSE $@

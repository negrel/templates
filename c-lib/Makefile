-include variables.mk

.PHONY: build/all
build/all: $(CMDS:$(CMD_DIR)/%=$(BUILD_DIR)/%)

build/%: CMD=$*
build/%:
	$(MAKE) $(BUILD_DIR)/$(CMD)

$(BUILD_DIR)/$(CMD): $(CMD_DIR)/$(CMD)/main.c
	$(MKDIR_P) $(BUILD_DIR)
	$(CC) $(CFLAGS) $< -o $@

$(BUILD_DIR)/$(TEST_DIR)/%: $(TEST_DIR)/%.c
	$(MKDIR_P) $(dir $@)
	$(CC) $(CFLAGS) $(TEST_LDFLAGS) $^ -o $@
	valgrind --quiet --leak-check=full --errors-for-leak-kinds=definite $@

.PHONY: test/%
test/%: $(BUILD_DIR)/$(TEST_DIR)/%_test
	$<

.PHONY: compile_flags.txt
compile_flags.txt: variables.mk
	echo $(CFLAGS) | tr ' ' '\n' > compile_flags.txt

.PHONY: clean
clean:
	$(RM) -r $(BUILD_DIR)


-include variables.mk

.PHONY: build
build: $(BUILD_DIR)/$(TARGET_BIN)

$(BUILD_DIR)/$(TARGET_BIN): $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $@

$(BUILD_DIR)/%.o: %.c
	$(MKDIR_P) $(dir $@)
	$(CC) $(CFLAGS) -c $< -o $@

$(BUILD_DIR)/$(TEST_DIR)/%: $(TEST_DIR)/%.c $(BUILD_DIR)/$(TARGET_LIB)
	$(MKDIR_P) $(dir $@)
	$(CC) $(TEST_CFLAGS) $(TEST_LDFLAGS) $< $(BUILD_DIR)/$(TARGET_LIB) -o $@

.PHONY: test/%
test/%: $(BUILD_DIR)/$(TEST_DIR)/%_test
	$<

.PHONY: compile_flags.txt
compile_flags.txt: variables.mk
	echo $(CFLAGS) | tr ' ' '\n' > compile_flags.txt

.PHONY: clean
clean:
	$(RM) -r $(BUILD_DIR)


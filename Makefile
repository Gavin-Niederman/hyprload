SOURCE_FILES := $(wildcard src/*.cpp)
INCLUDES := `pkg-config --cflags pixman-1 libdrm hyprland`
INCLUDES += -Iinclude

COMPILE_FLAGS := -g -fPIC --no-gnu-unique -std=c++23
COMPILE_DEFINES := -DWLR_USE_UNSTABLE

OBJECT_DIR := obj

LINK_FLAGS := -shared

all: hyprload.so

$(OBJECT_DIR)/%.o: src/%.cpp
	@mkdir -p $(OBJECT_DIR)
	g++ -c -o $@ $^ $(INCLUDES) $(COMPILE_FLAGS) $(COMPILE_DEFINES)

hyprload.so: $(addprefix $(OBJECT_DIR)/, $(notdir $(SOURCE_FILES:.cpp=.o)))
	g++ $(LINK_FLAGS) -o $@ $^ $(INCLUDES) $(COMPILE_FLAGS) $(COMPILE_DEFINES)

clean:
	rm -f hyprload.so
	rm -rf $(OBJECT_DIR)
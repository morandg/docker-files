FROM debian:12.1

RUN apt-get update && \
	apt-get upgrade --yes && \
	apt-get install --yes \
		build-essential \
		ca-certificates \
		cmake \
		gdb \
		git \
		iproute2 \
		lcov \
		libdbus-1-dev \
		libgtest-dev \
		libprotobuf-dev \
		libspdlog-dev \
		libpaho-mqtt-dev \
		libpaho-mqttpp-dev \
		libsqlite3-dev \
		libssl-dev \
		libtclap-dev \
		openssh-server \
		pkg-config \
		protobuf-compiler \
		qtbase5-dev \
		redis \
		rsync \
		sudo \
		sqlite3 \
		tmux

# Install spdlog_setup
COPY install-spdlog-setup.sh /tmp
RUN /tmp/install-spdlog-setup.sh && rm /tmp/install-spdlog-setup.sh

# Add developer user
RUN useradd --create-home developer && \
	echo developer:developer | chpasswd && \
	chsh -s /bin/bash developer && \
	gpasswd -a developer sudo

# Entry point
COPY entry-point.sh /entry-point.sh
RUN chmod +x /entry-point.sh
ENTRYPOINT /entry-point.sh

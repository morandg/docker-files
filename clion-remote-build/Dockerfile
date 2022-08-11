FROM debian:bullseye

RUN apt-get update && \
	apt-get upgrade --yes && \
	apt-get install --yes \
		build-essential \
		cmake \
		gdb \
		git \
		iproute2 \
		lcov \
		libdbus-1-dev \
		libprotobuf-dev \
		openssh-server \
		pkg-config \
		protobuf-compiler \
		qtbase5-dev \
		redis \
		rsync \
		sudo \
		tmux

# Install cpp_redis library
RUN git clone --recursive https://github.com/cpp-redis/cpp_redis.git /tmp/cpp_redis && \
	cd /tmp/cpp_redis && \
	mkdir build && \
	cd build && \
	cmake .. && \
	make -j$(nproc) && \
	make install

# Configure redis
RUN sed -i 's/^bind.*/bind 0.0.0.0/g' /etc/redis/redis.conf

# Add developer user
RUN useradd --create-home developer && \
	echo developer:developer | chpasswd && \
	chsh -s /bin/bash developer && \
	gpasswd -a developer sudo

# Entry point
COPY entry-point.sh /entry-point.sh
RUN chmod +x /entry-point.sh
ENTRYPOINT /entry-point.sh

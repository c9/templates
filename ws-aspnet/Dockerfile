FROM cloud9/workspace
MAINTAINER Peter Bozovic <peter.bozovic@ogilvy.com>

RUN sudo -u ubuntu -i bash -l -c "cd ~/ \
	&& git clone https://github.com/c9/core.git c9sdk \
	&& cd c9sdk \
	&& ./scripts/install-sdk.sh"

# Getting CoreClr dependencies
RUN apt-get -y install libunwind8 gettext libssl-dev libcurl3-dev zlib1g libicu-dev

# Installing Kestrel (web server)
RUN LIBUV_VERSION=1.8.0 \
    && sudo apt-get install make automake libtool curl \
	&& sudo curl -sSL https://github.com/libuv/libuv/archive/v${LIBUV_VERSION}.tar.gz | sudo tar zxfv - -C /usr/local/src \
    && cd /usr/local/src/libuv-$LIBUV_VERSION \
	&& sudo sh autogen.sh \
	&& sudo ./configure \
	&& sudo make \
	&& sudo make install \
    && sudo rm -rf /usr/local/src/libuv-$LIBUV_VERSION \
	&& cd ~/ \
	&& sudo ldconfig
	
# Installing DNVM
RUN sudo -u ubuntu -i bash -l -c "curl -sSL https://raw.githubusercontent.com/aspnet/Home/dev/dnvminstall.sh | DNX_BRANCH=dev sh"

# Installing Yeoman to hande project templates
RUN sudo -u ubuntu -i bash -l -c "sudo npm install -g npm"
RUN sudo -u ubuntu -i bash -l -c "npm install -g yo generator-aspnet"

ADD ./files/workspace /home/ubuntu/workspace
RUN mv /home/ubuntu/workspace/c9 /home/ubuntu/workspace/.c9
RUN chmod -R g+w /home/ubuntu/workspace && \
    chown -R ubuntu:ubuntu /home/ubuntu/workspace

# Generating ASPNET projects
RUN sudo -u ubuntu -i bash -l -c "cd ~/workspace \
	&& yo aspnet webbasic WebBasicApplication \
	&& yo aspnet web WebApplication \
	&& yo aspnet webapi WebApiApplication \
	&& yo aspnet console ConsoleApplication"

# Building projects
RUN sudo -u ubuntu -i bash -l -c "source ~/.dnx/dnvm/dnvm.sh && dnvm upgrade -r coreclr \
	&& cd ~/workspace/WebBasicApplication \
	&& dnvm exec default dnu restore \
	&& cd ~/workspace/WebApplication \
	&& dnvm exec default dnu restore \
	&& cd ~/workspace/WebApiApplication \
	&& dnvm exec default dnu restore \
	&& cd ~/workspace/ConsoleApplication \
	&& dnvm exec default dnu restore \
	"

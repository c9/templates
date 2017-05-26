FROM cloud9/workspace
MAINTAINER Roger Sachan <narayanroger@gmail.com>


# Basic installation of .NET Core without setup
RUN echo "deb [arch=amd64] http://apt-mo.trafficmanager.net/repos/dotnet/ trusty main" | sudo tee --append /etc/apt/sources.list.d/dotnetdev.list && \
    sudo apt-key adv --keyserver apt-mo.trafficmanager.net --recv-keys 417A0893 &&\
    sudo apt-get update && \
    sudo apt-get install dotnet-dev-1.0.0-preview2-003121 -y && \
    sudo apt-get clean && \
    sudo apt-get -y autoremove && \
    sudo apt-get -y clean && \
    sudo rm -rf /var/lib/apt/lists/*

#Installation of Yeoman&Dependencies with nodejs
RUN curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
RUN sudo apt-get install nodejs -y
RUN sudo npm install -g yo bower grunt-cli gulp
RUN sudo npm install -g generator-aspnet

RUN sudo -u ubuntu -i bash -l -c "cd ~/workspace"
RUN yo aspnet web WebApp
RUN yo aspnet console ConsoleAppCS

RUN cd ~/workspace/WebApp
RUN dotnet restore
RUN cd ~/workspace/ConsoleAppCS
RUN dotnet restore

RUN cd ~/workspace/ConsoleAppFS
RUN dotnet new --lang f#
RUN dotnet restore
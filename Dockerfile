FROM golang:latest

LABEL maintainer="shilpa_techno"
#path in container
WORKDIR /app
#fetching the mux repo
RUN go get -u github.com/gorilla/mux
#setting path
ENV mkdir -p $GOPATH/src/github.com/shilpa/restapi/
# adding environment variable
ENV GOPATH=$HOME/go
# Copy the source from the current directory to the Working Directory inside the container
COPY http-api.go /app/
# Build the Go app
RUN go build  && ./http-api.exe
# Expose port 8080 to the outside world
EXPOSE 5000
# Command to run the executable
CMD ["./http-api.exe"]
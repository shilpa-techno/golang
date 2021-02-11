# golang
Install golang from
https://golang.org/
check the golang installed by below command:
go version

we have docker file through which we can run our http-api.go file in order to build and exe file once it is build we can validate various posts in postman.
given api's --> /api/encrypt and /api/decrpyt

so we create a router and a function handler,Each router should handle the specified method (GET or POST)

walking through the code:
initially we need to import the libraries or dependency

import (
	"encoding/json"
	"net/http"
	"strconv"

	"github.com/gorilla/mux"
)

above set of lines will import the router dependency from mux url and to accept the json document we have to import "encoding/json" and for string conversion "strconv" and "net/http" to map and understand the endpoints.

To build and run the program:
go build && ./http-api

Creating our endpoints
Now we are going to establish the endpoints of our API, the way we will set this up is to create all of our endpoints in the main function, every endpoint needs a function to handle the request and we will define those below the main function.
The syntax for creating an endpoint looks like this:

router.HandleFunc("/<your-url>", <function-name>).Methods("<method>")
  
in our code:
router.HandleFunc("/posts", addItem).Methods("POST")

router.HandleFunc("/api/encrypt", getAllPosts).Methods("GET")

router.HandleFunc("/posts/{id}", getPost).Methods("GET")

 router.HandleFunc("/api/decrypt", getAllPosts).Methods("GET")
 
 http.ListenAndServe(":8000", router)  --> listening port
 
 Defining our models (structs)
 We will use a struct to represent a post
 
 getPosts()
 func getPosts(w http.ResponseWriter, r *http.Request) {
  w.Header().Set("Content-Type", "application/json")
  json.NewEncoder(w).Encode(posts)
}

Here I have defined the function that gets all posts, we’re just setting the header “Content-Type” to “application/json” . Then we use the encoding package to encode all the posts as well as returning it at the same line.

getPost()
func getPost(w http.ResponseWriter, r *http.Request) {
	// get the ID of the post from the route parameter
	var idParam string = mux.Vars(r)["id"]
	id, err := strconv.Atoi(idParam)
	if err != nil {
		// there was an error
		w.WriteHeader(400)
		w.Write([]byte("ID could not be converted to integer"))
		return
	}
  
  post this we can handle all the erros and handlers and proper header in json format
  
  Dockerfile has the image so we need to build our image by using docker build command and post that we can run in container by creating the container using docker run  command and mapping the container port to app port to 5000
  
  and can be tested with various posible approches for the http like GET POST DELETE CREATE and code handles the varios error code
  
  accept in json and validating the input  with proper HTTP header
  
  
    func test(w http.ResponseWriter, r *http.Request) {
	//w.Write([]byte("testing encrypt and decrypt api"))
	w.Header().Set("Content-Type", "application/json")

	json.NewEncoder(w).Encode(struct {
		ID string
	}{"SHILPA"})
     }


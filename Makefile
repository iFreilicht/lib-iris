all:
	@echo "Please only make one target at a time and make sure this is a submodule to your desired target."

python: iris.proto
	protoc iris.proto --python_out=..

arduino: iris.proto iris.options
	# This requires the nanopb version of protoc to be in PATH
	# See https://github.com/nanopb/nanopb#using-the-protocol-buffers-compiler-protoc
	protoc iris.proto --nanopb_out=..

test: iris.proto iris.options
	protoc iris.proto --python_out=. --nanopb_out=.

clean:
	rm -f ../iris.pb.? ../iris_pb2.py
	rm -f iris.pb.? iris_pb2.py

# Copyright (C) Teemu Suutari

VPATH  := src src/Lzh src/Zip

CC	= clang
CXX	= clang++
COMMONFLAGS = -Os -Wall -Wsign-compare -Wshorten-64-to-32 -Wno-error=multichar -Wno-multichar -Isrc
CFLAGS	= $(COMMONFLAGS)
CXXFLAGS = $(COMMONFLAGS) -std=c++14 -fno-rtti

PROG	= ancient
OBJS	= Buffer.o Common.o FixedMemoryBuffer.o SubBuffer.o CRC16.o CRC32.o \
	Decompressor.o InputStream.o OutputStream.o XPKDecompressor.o XPKMaster.o main.o \
	ACCADecompressor.o BLZWDecompressor.o BZIP2Decompressor.o CBR0Decompressor.o \
	CRMDecompressor.o CYB2Decoder.o DEFLATEDecompressor.o DLTADecode.o DMSDecompressor.o \
	FASTDecompressor.o FBR2Decompressor.o FRLEDecompressor.o HFMNDecompressor.o \
	HUFFDecompressor.o ILZRDecompressor.o IMPDecompressor.o LHLBDecompressor.o \
	LIN1Decompressor.o LIN2Decompressor.o LZBSDecompressor.o LZW2Decompressor.o \
	LZW4Decompressor.o LZW5Decompressor.o LZXDecompressor.o MASHDecompressor.o \
	NONEDecompressor.o NUKEDecompressor.o PPDecompressor.o RAKEDecompressor.o \
	RDCNDecompressor.o RLENDecompressor.o RNCDecompressor.o SDHCDecompressor.o \
	SHR3Decompressor.o SHRIDecompressor.o SLZ3Decompressor.o SMPLDecompressor.o \
	SQSHDecompressor.o TDCSDecompressor.o TPWMDecompressor.o ZENODecompressor.o \
	LH1Decompressor.o LH2Decompressor.o LZHDecompressor.o \
	ImplodeDecompressor.o ReduceDecompressor.o ShrinkDecompressor.o ZIPDecompressor.o

all: $(PROG)

.cpp.o:
	$(CXX) $(CXXFLAGS) -o $@ -c $<

.c.o:
	$(CC) $(CFLAGS) -o $@ -c $<

$(PROG): $(OBJS)
	$(CXX) $(CFLAGS) -o $(PROG) $(OBJS)

clean:
	rm -f $(OBJS) $(PROG) *~ src/*~

.PHONY:

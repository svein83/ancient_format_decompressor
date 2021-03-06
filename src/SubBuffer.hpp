/* Copyright (C) Teemu Suutari */

#ifndef SUBBUFFER_HPP
#define SUBBUFFER_HPP

#include <stddef.h>
#include <stdint.h>

#include "Buffer.hpp"

// helpers to splice Buffer

template <typename T>
class GenericSubBuffer : public Buffer
{
public:
	GenericSubBuffer(const GenericSubBuffer&)=delete;
	GenericSubBuffer& operator=(const GenericSubBuffer&)=delete;

	GenericSubBuffer(T &base,size_t start,size_t length) :
		_base(base),
		_start(start),
		_length(length)
	{
		// if the sub-buffer is invalid, we set both _start and _length to 0
		if (start+length>_base.size())
		{
			_start=0;
			_length=0;
		}
	}
	
	virtual ~GenericSubBuffer() { }

	virtual const uint8_t *data() const noexcept override
	{
		return _base.data()+_start;
	}

	virtual uint8_t *data() override;

	virtual size_t size() const noexcept override
	{
		return _length;
	}

	// can only make the buffer smaller, can't run away from the current bounds
	void adjust(size_t start,size_t length)
	{
		if (start<_start || start+length>_start+_length) throw OutOfBoundsError();
		_start=start;
		_length=length;
	}

private:
	T &_base;
	size_t	_start;
	size_t	_length;
};

typedef GenericSubBuffer<Buffer> SubBuffer;
typedef GenericSubBuffer<const Buffer> ConstSubBuffer;

#endif

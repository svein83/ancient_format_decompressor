/* Copyright (C) Teemu Suutari */

#ifndef HUFFDECOMPRESSOR_HPP
#define HUFFDECOMPRESSOR_HPP

#include "Decompressor.hpp"

// XPK sub-decompressor
class HUFFDecompressor : public Decompressor
{
public:
	HUFFDecompressor(uint32_t hdr,const Buffer &packedData);

	virtual ~HUFFDecompressor();

	virtual bool isValid() const override final;
	virtual bool verifyPacked() const override final;
	virtual bool verifyRaw(const Buffer &rawData) const override final;

	virtual size_t getPackedSize() const override final;
	virtual size_t getRawSize() const override final;

	virtual bool decompress(Buffer &rawData) override final;

	static bool detectHeaderXPK(uint32_t hdr);

protected:
	virtual const std::string &getSubName() const override final;

private:
	bool		_isValid=false;
};

#endif
cbuffer ConstantBuffer : register(b0)
{
	float4x4 viewproj;
	float4 eye;
	int height;
	int width;
}
 
struct DS_OUTPUT
{
	float4 pos : SV_POSITION;
	float4 norm : NORMAL;
};
 
// Output control point
struct HS_CONTROL_POINT_OUTPUT
{
	float4 pos : POSITION0;
	float4 norm : NORMAL;
};
 
// Output patch constant data.
struct HS_CONSTANT_DATA_OUTPUT
{
	float EdgeTessFactor[3] : SV_TessFactor; // e.g. would be [4] for a quad domain
	float InsideTessFactor : SV_InsideTessFactor; // e.g. would be Inside[2] for a quad domain
};
 
//#define NUM_CONTROL_POINTS 3
 
//[domain("tri")]
//DS_OUTPUT main(
//    HS_CONSTANT_DATA_OUTPUT input,
//    float3 domain : SV_DomainLocation,
//    const OutputPatch<HS_CONTROL_POINT_OUTPUT, NUM_CONTROL_POINTS> patch)
//{
//	DS_OUTPUT output;
 
//	output.pos = float4(patch[0].pos.xyz * domain.x + patch[1].pos.xyz * domain.y + patch[2].pos.xyz * domain.z, 1);
//	output.pos = mul(output.pos, viewproj);
//	output.norm = float4(patch[0].norm.xyz * domain.x + patch[1].norm.xyz * domain.y + patch[2].norm.xyz * domain.z, 1);
 
//	return output;
//}
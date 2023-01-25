struct PatchTess
{

    float EdgeTess[4] : SV_TessFactor;

    float InsideTess[2] : SV_InsideTessFactor;

// Additional info you want associated per patch.

};

PatchTess ConstantHS(InputPatch<VertexOut, 4> patch,

uint patchID : SV_PrimitiveID)
{

    PatchTess pt;

// Uniformly tessellate the patch 3 times.

    pt.EdgeTess[0] = 3; // Left edge

    pt.EdgeTess[1] = 3; // Top edge

    pt.EdgeTess[2] = 3; // Right edge

    pt.EdgeTess[3] = 3; // Bottom edge

    pt.InsideTess[0] = 3; // u-axis (columns)

    pt.InsideTess[1] = 3; // v-axis (rows)

    return pt;

}

struct HullOut
{

    float3 PosL : POSITION;

};

[domain("quad")]

[partitioning("integer")]

[outputtopology("triangle_cw")]

[outputcontrolpoints(4)]

[patchconstantfunc("ConstantHS")]

[maxtessfactor(64.0f)]

HullOut HS(InputPatch<VertexOut, 4> p,

uint i : SV_OutputControlPointID,

uint patchId : SV_PrimitiveID)
{

    HullOut hout;

    hout.PosL = p[i].PosL;

    return hout;

}
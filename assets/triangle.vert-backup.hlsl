cbuffer ubo : register(b0)
{
    row_major float4x4 ubo_projectionMatrix : packoffset(c0);
    row_major float4x4 ubo_modelMatrix : packoffset(c4);
    row_major float4x4 ubo_viewMatrix : packoffset(c8);
};

static float4 gl_Position;
static float3 outColor;
static float3 inColor;
static float3 inPos;

struct Cross_Input
{
    float3 inPos : POSITION;
    float3 inColor : COLOR;
};

struct Cross_Output
{
    float3 outColor : COLOR;
    float4 gl_Position : SV_Position;
};

void vert_main()
{
    outColor = inColor;
    gl_Position = mul(float4(inPos, 1.0f), mul(ubo_modelMatrix, mul(ubo_viewMatrix, ubo_projectionMatrix)));
}

Cross_Output main(SCross_Input stage_input)
{
    inColor = stage_input.inColor;
    inPos = stage_input.inPos;
    vert_main();
    SCross_Output stage_output;
    stage_output.gl_Position = gl_Position;
    stage_output.outColor = outColor;
    return stage_output;
}

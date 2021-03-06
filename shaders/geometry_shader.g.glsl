#version 430 core

layout (points) in;
layout (triangle_strip, max_vertices = 4) out;
out vec4 vtxColor;

in vData
{
    vec4 transformedColor;
} v_color[];


void main(void)
{
    int i = 0;
    int points = 0;

    for ( i = 0; i < gl_in.length(); i++)
    {
        float size = 2.0;
		gl_Position = gl_in[i].gl_Position + vec4(0.0, 0.0, 0.0, 0.0);
		vtxColor = v_color[i].transformedColor;
        EmitVertex();

        gl_Position = gl_in[i].gl_Position + vec4(0.0, size, 0.0, 0.0);
        vtxColor = v_color[i].transformedColor;
        EmitVertex();

        gl_Position = gl_in[i].gl_Position + vec4(size, 0.0, 0.0, 0.0);
        vtxColor = v_color[i].transformedColor;
        EmitVertex();

		gl_Position = gl_in[i].gl_Position + vec4(size, size, 0.0, 0.0);
        vtxColor = v_color[i].transformedColor;
        EmitVertex();

        EndPrimitive();
    }
}
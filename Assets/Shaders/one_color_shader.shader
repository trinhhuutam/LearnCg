Shader "One Color Shader" 													/* Name of shader */
{
	SubShader 																/* Unity chooses the subshader that fits the GPU best */
	{
		Pass																/* Some shader require multiple passes */
		{
			CGPROGRAM 														/* Begin Unity's Cg */
			
			#pragma vertex vert												/* This specifies the vert function as the vertex shader	*/
			#pragma fragment frag											/* This specifies the frag function as the fragment shader */
			
			/*vertex shader */
			float4 vert(float4 vertexPos: POSITION) : SV_POSITION
			{
				return mul(UNITY_MATRIX_MVP, vertexPos);						/* Transform the vertex input parameter vertexPos with the built-in
																			** maxtrix UNITY_MAX_MVP and then return it as a nameless vertex output parameter
																			*/
			}
			
			/*fragment shader */
			float4 frag(void) : COLOR
			{
				return float4(0.6, 1.0, 0.0, 1.0);
			}
			
			ENDCG															/* Ends Cg*/
		}
	}
}

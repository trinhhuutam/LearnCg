Shader "Custom/Vertex_Input" 
{
	SubShader 
	{
		Pass
		{
	
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag

			struct vertexInput 
			{
				float4	vertex: POSITION;	/* position in object's coordinates ie: local or model coordinate	*/
				float4	tangent: TANGENT;		/* vector orthogonal to the surface normal							*/
				float3	normal:	NORMAL;		/* surface normal vector, in object's coordinate usually normalized to unit length */
				float4	texcoord0: TEXCOORD0;	/* 0th set of texture coordinate */
				float4	texcoord1: TEXCOORD1;	/* 1th...*/
				fixed4	color: COLOR;
			};
			
			struct vertexOutput
			{
				float4 pos: SV_POSITION;
				float4 col: TEXCOORD0;
			};

			vertexOutput vert(vertexInput input)
			{
				vertexOutput output;
				output.pos = mul(UNITY_MATRIX_MVP, input.vertex);
				output.col = input.tangent;
				
				return output;
			}
			
			float4	frag(vertexOutput input):COLOR
			{
				return input.col;
			}
			
			ENDCG
		}
	} 
}

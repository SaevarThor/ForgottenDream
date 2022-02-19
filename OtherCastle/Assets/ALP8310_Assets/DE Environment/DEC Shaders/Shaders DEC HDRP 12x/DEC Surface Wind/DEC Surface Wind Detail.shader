// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "DEC/Surface Wind/Surface Wind Detail"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		[ASEBegin][Header(GLOBAL SETTINGS)][EmissionFlags][Space(5)]_EmissionFlags("Global Illumination Emissive", Float) = 0
		[HideInInspector][Enum(Auto,0,On,1,Off,2)]_DoubleSidedGIMode("Double sided GI mode", Float) = 0
		[HideInInspector][Enum(UnityEditor.Rendering.HighDefinition.OpaqueCullMode)]_OpaqueCullMode("_OpaqueCullMode", Int) = 2
		[HideInInspector][DE_DrawerToggleNoKeyword]_AlphaToMaskInspectorValue("_AlphaToMaskInspectorValue", Float) = 0
		[HideInInspector][DE_DrawerToggleNoKeyword]_EnableBlendModePreserveSpecularLighting("_EnableBlendModePreserveSpecularLighting", Float) = 1
		[HideInInspector][DE_DrawerToggleNoKeyword]_TransparentWritingMotionVec(" _TransparentWritingMotionVec", Float) = 0
		[HideInInspector][DE_DrawerToggleNoKeyword]_EnableGeometricSpecularAA("Enable Geometric Specular AA", Float) = 0
		[HideInInspector]_SpecularAAScreenSpaceVariance("Specular AA Screen Space Variance", Range( 0 , 1)) = 0.1
		[HideInInspector]_SpecularAAThreshold("Specular AA Threshold", Range( 0 , 1)) = 0.2
		[HideInInspector]_AlphaCutoffShadow("_AlphaCutoffShadow", Range( 0 , 1)) = 1
		[Header(MAIN MAPS)]_Color("Tint", Color) = (1,1,1,0)
		[DE_DrawerTextureSingleLine]_MainTex("Albedo Map", 2D) = "white" {}
		_Brightness("Brightness", Range( 0 , 2)) = 1
		_TilingX("Tiling X", Float) = 1
		_TilingY("Tiling Y", Float) = 1
		_OffsetX("Offset X", Float) = 0
		_OffsetY("Offset Y", Float) = 0
		[Normal][DE_DrawerTextureSingleLine]_BumpMap("Normal Map", 2D) = "bump" {}
		_NormalStrength("Normal Strength", Float) = 1
		[DE_DrawerTextureSingleLine]_MetallicGlossMap("Metallic Map", 2D) = "white" {}
		_MetallicStrength("Metallic Strength", Range( 0 , 1)) = 0
		[DE_DrawerTextureSingleLine]_OcclusionMap("Occlusion Map", 2D) = "white" {}
		[DE_DrawerToggleNoKeyword]_OcclusionSource("Occlusion is Baked", Float) = 0
		_OcclusionStrengthAO("Occlusion Strength", Range( 0 , 1)) = 0
		[DE_DrawerTextureSingleLine]_SmoothnessMap("Smoothness Map", 2D) = "white" {}
		[Enum(Smoothness,0,Roughness,1,Geometric,2)]_SmoothnessSource("Smoothness Source", Int) = 0
		[DE_DrawerSliderRemap(_SmoothnessMin, _SmoothnessMax,0, 1)]_Smoothness("Smoothness", Vector) = (0,0,0,0)
		[HideInInspector]_SmoothnessMin("Smoothness Min", Range( 0 , 1)) = 0
		[HideInInspector]_SmoothnessMax("Smoothness Max", Range( 0 , 1)) = 0
		[Header(BENT NORMAL)][Enum(Tangent,0,Object,1)]_NormalMapSpace("Normal Map Space", Int) = 0
		[Normal][DE_DrawerTextureSingleLine]_BentNormalMap("Bent Normal Map", 2D) = "bump" {}
		_NormalStrengthBent("Bent Normal Strength", Float) = 1
		[Header(DETAIL)][DE_DrawerToggleNoKeyword]_EnableDetailMap("Enable", Float) = 0
		_ColorDetail("Tint", Color) = (1,1,1,0)
		[DE_DrawerTextureSingleLine]_DetailAlbedoMap("Albedo Map", 2D) = "white" {}
		_DetailTilingXDetail("Tiling X", Float) = 1
		_DetailTilingYDetail("Tiling Y", Float) = 1
		_DetailOffsetXDetail("Offset X", Float) = 0
		_DetailOffsetYDetail("Offset Y", Float) = 0
		[Normal][DE_DrawerTextureSingleLine]_DetailNormalMap("Normal Map", 2D) = "bump" {}
		_DetailNormalMapScale("Normal Strength", Float) = 1
		_DetailBlendInfluence("Blend Influence", Range( 0 , 3)) = 0
		[Enum(Red,0,Green,1,Blue,2)]_BlendColor("Blend Vertex Color", Int) = 0
		_BlendHeight("Blend Height", Range( 0 , 1.25)) = 1
		_DetailBlendSmooth("Blend Smooth", Range( 0.01 , 0.5)) = 0.35
		[Header(DETAIL MASK)][Enum(Off,0,Active,1,Active Inverted,2)]_EnableDetailMask("Enable Detail Mask", Int) = 0
		[DE_DrawerTextureSingleLine]_DetailMaskMap("Mask Map", 2D) = "white" {}
		_Detail_BlendAmountMask("Blend Amount", Range( 0.001 , 1)) = 0.5
		_Detail_BlendHardnessMask("Blend Hardness", Range( 0.001 , 5)) = 1
		_Detail_BlendFalloffMask("Blend Falloff", Range( 0.001 , 0.999)) = 0.5
		_DetailTilingXDetailMask("Tiling X", Float) = 1
		_DetailTilingYDetailMask("Tiling Y", Float) = 1
		_DetailOffsetXDetailMask("Offset X", Float) = 0
		_DetailOffsetYDetailMask("Offset Y", Float) = 0
		[Enum(Off,0,Global,1,Local,2)][Header(WIND)]_WindMode("Wind Mode", Int) = 1
		[Header(WIND MODE GLOBAL)]_GlobalWindInfluenceOther("Main", Float) = 1
		[Header(WIND MODE LOCAL)]_LocalWindStrength("Main", Float) = 1
		_LocalWindPulse("Pulse Frequency", Float) = 0.1
		_LocalWindDirection("Direction", Range( 0 , 360)) = 0
		[ASEEnd]_LocalRandomWindOffset("Random Offset", Float) = 0.2

		[HideInInspector] _RenderQueueType("Render Queue Type", Float) = 1
		[HideInInspector] [ToggleUI] _AddPrecomputedVelocity("Add Precomputed Velocity", Float) = 1
		[HideInInspector] [ToggleUI]_SupportDecals("Boolean", Float) = 1
		[HideInInspector] _StencilRef("Stencil Ref", Int) = 0
		[HideInInspector] _StencilWriteMask("Stencil Write Mask", Int) = 6
		[HideInInspector] _StencilRefDepth("Stencil Ref Depth", Int) = 8
		[HideInInspector] _StencilWriteMaskDepth("Stencil Write Mask Depth", Int) = 8
		[HideInInspector] _StencilRefMV("Stencil Ref MV", Int) = 40
		[HideInInspector] _StencilWriteMaskMV("Stencil Write Mask MV", Int) = 40
		[HideInInspector] _StencilRefDistortionVec("Stencil Ref Distortion Vec", Int) = 4
		[HideInInspector] _StencilWriteMaskDistortionVec("Stencil Write Mask Distortion Vec", Int) = 4
		[HideInInspector] _StencilWriteMaskGBuffer("Stencil Write Mask GBuffer", Int) = 14
		[HideInInspector] _StencilRefGBuffer("Stencil Ref GBuffer", Int) = 10
		[HideInInspector] _ZTestGBuffer("ZTest GBuffer", Int) = 4
		[HideInInspector] [ToggleUI] _RequireSplitLighting("Require Split Lighting", Float) = 0
		[HideInInspector] [ToggleUI] _ReceivesSSR("Receives SSR", Float) = 1
		[HideInInspector] [ToggleUI] _ReceivesSSRTransparent("Boolean", Float) = 0
		[HideInInspector] _SurfaceType("Surface Type", Float) = 0
		[HideInInspector] _BlendMode("Blend Mode", Float) = 0
		[HideInInspector] _SrcBlend("Src Blend", Float) = 1
		[HideInInspector] _DstBlend("Dst Blend", Float) = 0
		[HideInInspector] _AlphaSrcBlend("Alpha Src Blend", Float) = 1
		[HideInInspector] _AlphaDstBlend("Alpha Dst Blend", Float) = 0
		[HideInInspector] [ToggleUI] _ZWrite("ZWrite", Float) = 1
		[HideInInspector] [ToggleUI] _TransparentZWrite("Transparent ZWrite", Float) = 1
		[HideInInspector] _CullMode("Cull Mode", Float) = 2
		[HideInInspector] _TransparentSortPriority("Transparent Sort Priority", Int) = 0
		[HideInInspector] [ToggleUI] _EnableFogOnTransparent("Enable Fog On Transparent", Float) = 1
		[HideInInspector] _CullModeForward("Cull Mode Forward", Float) = 2
		[HideInInspector] [Enum(Front, 1, Back, 2)] _TransparentCullMode("Transparent Cull Mode", Float) = 2
		[HideInInspector] _ZTestDepthEqualForOpaque("ZTest Depth Equal For Opaque", Int) = 4
		[HideInInspector] [Enum(UnityEngine.Rendering.CompareFunction)] _ZTestTransparent("ZTest Transparent", Float) = 4
		[HideInInspector] [ToggleUI] _TransparentBackfaceEnable("Transparent Backface Enable", Float) = 0
		[HideInInspector] [ToggleUI] _AlphaCutoffEnable("Alpha Cutoff Enable", Float) = 1
		[HideInInspector] [ToggleUI] _UseShadowThreshold("Use Shadow Threshold", Float) = 1
		[HideInInspector] [ToggleUI] _DoubleSidedEnable("Double Sided Enable", Float) = 0
		[HideInInspector] [Enum(Flip, 0, Mirror, 1, None, 2)] _DoubleSidedNormalMode("Double Sided Normal Mode", Float) = 2
		[HideInInspector] _DoubleSidedConstants("DoubleSidedConstants", Vector) = (1,1,-1,0)
		//_TessPhongStrength( "Tess Phong Strength", Range( 0, 1 ) ) = 0.5
		//_TessValue( "Tess Max Tessellation", Range( 1, 32 ) ) = 16
		//_TessMin( "Tess Min Distance", Float ) = 10
		//_TessMax( "Tess Max Distance", Float ) = 25
		//_TessEdgeLength ( "Tess Edge length", Range( 2, 50 ) ) = 16
		//_TessMaxDisp( "Tess Max Displacement", Float ) = 25
	}

	SubShader
	{
		LOD 0

		

		Tags { "RenderPipeline"="HDRenderPipeline" "RenderType"="Opaque" "Queue"="Geometry" "NatureRendererInstancing"="True" }

		HLSLINCLUDE
		#pragma target 4.5
		#pragma only_renderers d3d11 metal vulkan xboxone xboxseries playstation switch 
		#pragma multi_compile_instancing
		#pragma instancing_options renderinglayer

		struct GlobalSurfaceDescription // GBuffer Forward META TransparentBackface
		{
			float3 Albedo;
			float3 Normal;
			float3 BentNormal;
			float3 Specular;
			float CoatMask;
			float Metallic;
			float3 Emission;
			float Smoothness;
			float Occlusion;
			float Alpha;
			float AlphaClipThreshold;
			float AlphaClipThresholdShadow;
			float AlphaClipThresholdDepthPrepass;
			float AlphaClipThresholdDepthPostpass;
			float SpecularAAScreenSpaceVariance;
			float SpecularAAThreshold;
			float SpecularOcclusion;
			float DepthOffset;
			//Refraction
			float RefractionIndex;
			float3 RefractionColor;
			float RefractionDistance;
			//SSS/Translucent
			float Thickness;
			float SubsurfaceMask;
			float DiffusionProfile;
			//Anisotropy
			float Anisotropy;
			float3 Tangent;
			//Iridescent
			float IridescenceMask;
			float IridescenceThickness;
			//BakedGI
			float3 BakedGI;
			float3 BakedBackGI;
		};

		struct AlphaSurfaceDescription // ShadowCaster
		{
			float Alpha;
			float AlphaClipThreshold;
			float AlphaClipThresholdShadow;
			float DepthOffset;
		};

		struct SceneSurfaceDescription // SceneSelection
		{
			float Alpha;
			float AlphaClipThreshold;
			float DepthOffset;
		};

		struct PrePassSurfaceDescription // DepthPrePass
		{
			float3 Normal;
			float Smoothness;
			float Alpha;
			float AlphaClipThresholdDepthPrepass;
			float DepthOffset;
		};

		struct PostPassSurfaceDescription //DepthPostPass
		{
			float Alpha;
			float AlphaClipThresholdDepthPostpass;
			float DepthOffset;
		};

		struct SmoothSurfaceDescription // MotionVectors DepthOnly
		{
			float3 Normal;
			float Smoothness;
			float Alpha;
			float AlphaClipThreshold;
			float DepthOffset;
		};

		struct DistortionSurfaceDescription //Distortion
		{
			float Alpha;
			float2 Distortion;
			float DistortionBlur;
			float AlphaClipThreshold;
		};
		
		#ifndef ASE_TESS_FUNCS
		#define ASE_TESS_FUNCS
		float4 FixedTess( float tessValue )
		{
			return tessValue;
		}
		
		float CalcDistanceTessFactor (float4 vertex, float minDist, float maxDist, float tess, float4x4 o2w, float3 cameraPos )
		{
			float3 wpos = mul(o2w,vertex).xyz;
			float dist = distance (wpos, cameraPos);
			float f = clamp(1.0 - (dist - minDist) / (maxDist - minDist), 0.01, 1.0) * tess;
			return f;
		}

		float4 CalcTriEdgeTessFactors (float3 triVertexFactors)
		{
			float4 tess;
			tess.x = 0.5 * (triVertexFactors.y + triVertexFactors.z);
			tess.y = 0.5 * (triVertexFactors.x + triVertexFactors.z);
			tess.z = 0.5 * (triVertexFactors.x + triVertexFactors.y);
			tess.w = (triVertexFactors.x + triVertexFactors.y + triVertexFactors.z) / 3.0f;
			return tess;
		}

		float CalcEdgeTessFactor (float3 wpos0, float3 wpos1, float edgeLen, float3 cameraPos, float4 scParams )
		{
			float dist = distance (0.5 * (wpos0+wpos1), cameraPos);
			float len = distance(wpos0, wpos1);
			float f = max(len * scParams.y / (edgeLen * dist), 1.0);
			return f;
		}

		float DistanceFromPlaneASE (float3 pos, float4 plane)
		{
			return dot (float4(pos,1.0f), plane);
		}

		bool WorldViewFrustumCull (float3 wpos0, float3 wpos1, float3 wpos2, float cullEps, float4 planes[6] )
		{
			float4 planeTest;
			planeTest.x = (( DistanceFromPlaneASE(wpos0, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos1, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos2, planes[0]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.y = (( DistanceFromPlaneASE(wpos0, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos1, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos2, planes[1]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.z = (( DistanceFromPlaneASE(wpos0, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos1, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos2, planes[2]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.w = (( DistanceFromPlaneASE(wpos0, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos1, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos2, planes[3]) > -cullEps) ? 1.0f : 0.0f );
			return !all (planeTest);
		}

		float4 DistanceBasedTess( float4 v0, float4 v1, float4 v2, float tess, float minDist, float maxDist, float4x4 o2w, float3 cameraPos )
		{
			float3 f;
			f.x = CalcDistanceTessFactor (v0,minDist,maxDist,tess,o2w,cameraPos);
			f.y = CalcDistanceTessFactor (v1,minDist,maxDist,tess,o2w,cameraPos);
			f.z = CalcDistanceTessFactor (v2,minDist,maxDist,tess,o2w,cameraPos);

			return CalcTriEdgeTessFactors (f);
		}

		float4 EdgeLengthBasedTess( float4 v0, float4 v1, float4 v2, float edgeLength, float4x4 o2w, float3 cameraPos, float4 scParams )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;
			tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
			tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
			tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
			tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			return tess;
		}

		float4 EdgeLengthBasedTessCull( float4 v0, float4 v1, float4 v2, float edgeLength, float maxDisplacement, float4x4 o2w, float3 cameraPos, float4 scParams, float4 planes[6] )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;

			if (WorldViewFrustumCull(pos0, pos1, pos2, maxDisplacement, planes))
			{
				tess = 0.0f;
			}
			else
			{
				tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
				tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
				tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
				tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			}
			return tess;
		}
		#endif //ASE_TESS_FUNCS
		ENDHLSL
		
		Pass
		{
			
			Name "GBuffer"
			Tags { "LightMode"="GBuffer" "NatureRendererInstancing"="True" }

			Cull [_CullMode]
			ZTest [_ZTestGBuffer]

			Stencil
			{
				Ref [_StencilRefGBuffer]
				WriteMask [_StencilWriteMaskGBuffer]
				Comp Always
				Pass Replace
				Fail Keep
				ZFail Keep
			}


			HLSLPROGRAM

			#define _ALPHATEST_SHADOW_ON 1
			#define _ENABLE_GEOMETRIC_SPECULAR_AA 1
			#define _SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL 1
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_BENT_NORMAL 1
			#define _AMBIENT_OCCLUSION 1
			#define HAVE_MESH_MODIFICATION
			#define ASE_SRP_VERSION 100400
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local _DOUBLESIDED_ON
			#pragma shader_feature_local _ _BLENDMODE_ALPHA _BLENDMODE_ADD _BLENDMODE_PRE_MULTIPLY
			#pragma shader_feature_local _ENABLE_FOG_ON_TRANSPARENT
			#pragma shader_feature_local _ALPHATEST_ON

			#if !defined(DEBUG_DISPLAY) && defined(_ALPHATEST_ON)
			#define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
			#endif

			#define SHADERPASS SHADERPASS_GBUFFER
			#pragma multi_compile _ DEBUG_DISPLAY
			#pragma multi_compile _ LIGHTMAP_ON
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ DYNAMICLIGHTMAP_ON
			#pragma multi_compile _ SHADOWS_SHADOWMASK
			#pragma multi_compile DECALS_OFF DECALS_3RT DECALS_4RT
			#pragma multi_compile _ LIGHT_LAYERS

			#pragma vertex Vert
			#pragma fragment Frag

			//#define UNITY_MATERIAL_LIT

			#if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
			#endif

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#ifdef DEBUG_DISPLAY
				#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
			#endif

			CBUFFER_START( UnityPerMaterial )
			float4 _Smoothness;
			half4 _ColorDetail;
			float4 _Color;
			float _SmoothnessMax;
			half _DetailOffsetXDetailMask;
			half _DetailOffsetYDetailMask;
			half _Detail_BlendAmountMask;
			half _Detail_BlendHardnessMask;
			half _Detail_BlendFalloffMask;
			half _DetailBlendInfluence;
			int _BlendColor;
			half _BlendHeight;
			half _DetailBlendSmooth;
			float _EnableDetailMap;
			half _NormalStrength;
			half _DetailNormalMapScale;
			int _NormalMapSpace;
			half _NormalStrengthBent;
			float _MetallicStrength;
			int _SmoothnessSource;
			float _OcclusionStrengthAO;
			float _OcclusionSource;
			float _AlphaCutoffShadow;
			float _SpecularAAScreenSpaceVariance;
			float _DetailTilingYDetailMask;
			float _DetailTilingXDetailMask;
			half _DetailOffsetXDetail;
			float _EnableGeometricSpecularAA;
			float _SmoothnessMin;
			float _DoubleSidedGIMode;
			half _EmissionFlags;
			float _TransparentWritingMotionVec;
			float _EnableBlendModePreserveSpecularLighting;
			float _AlphaToMaskInspectorValue;
			int _OpaqueCullMode;
			int _WindMode;
			float _GlobalWindInfluenceOther;
			float _LocalWindStrength;
			float _LocalRandomWindOffset;
			float _LocalWindPulse;
			float _LocalWindDirection;
			float _TilingX;
			float _TilingY;
			float _OffsetX;
			float _OffsetY;
			half _Brightness;
			int _EnableDetailMask;
			float _DetailTilingXDetail;
			float _DetailTilingYDetail;
			half _DetailOffsetYDetail;
			float _SpecularAAThreshold;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			int _Global_Wind_Main_Fade_Enabled;
			float _Global_Wind_Main_Intensity;
			float _Global_Wind_Main_RandomOffset;
			float _Global_Wind_Main_Pulse;
			float _Global_Wind_Main_Direction;
			float _Global_Wind_Main_Fade_Bias;
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_trilinear_repeat);
			TEXTURE2D(_DetailAlbedoMap);
			TEXTURE2D(_DetailMaskMap);
			TEXTURE2D(_BumpMap);
			TEXTURE2D(_DetailNormalMap);
			TEXTURE2D(_BentNormalMap);
			TEXTURE2D(_MetallicGlossMap);
			TEXTURE2D(_SmoothnessMap);
			TEXTURE2D(_OcclusionMap);


			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_FRAG_COLOR
			#pragma instancing_options procedural:SetupNatureRenderer forwardadd
			#pragma multi_compile GPU_FRUSTUM_ON __
			#include "Nature Renderer.cginc"
			#pragma multi_compile_local _ NATURE_RENDERER
			#pragma shader_feature_local _ALPHATOMASK_ON
			#pragma shader_feature_local _ _VERTEX_DISPLACEMENT _PIXEL_DISPLACEMENT
			#pragma shader_feature_local_vertex _VERTEX_DISPLACEMENT_LOCK_OBJECT_SCALE
			#pragma shader_feature_local _DISPLACEMENT_LOCK_TILING_SCALE
			#pragma shader_feature_local_fragment _PIXEL_DISPLACEMENT_LOCK_OBJECT_SCALE


			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
				#define ASE_NEED_CULLFACE 1
			#endif

			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				float4 positionCS : SV_Position;
				float3 interp00 : TEXCOORD0;
				float3 interp01 : TEXCOORD1;
				float4 interp02 : TEXCOORD2;
				float4 interp03 : TEXCOORD3;
				float4 interp04 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};


			float Wind_Globalfloatswitch( int m_switch, float m_Off, float m_Global, float m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float(0);
			}
			
			float2 DirectionalEquation( float _WindDirection )
			{
				float d = _WindDirection * 0.0174532924;
				float xL = cos(d) + 1 / 2;
				float zL = sin(d) + 1 / 2;
				return float2(zL,xL);
			}
			
			float3 Wind_Globalfloat3switch( int m_switch, float3 m_Off, float3 m_Global, float3 m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float3(0,0,0);
			}
			
			float3 Wind_Fadefloat3switch3050_g3455( int m_switch, float3 m_Off, float3 m_ActiveFadeOut, float3 m_ActiveFadeIn )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_ActiveFadeOut;
				else if(m_switch ==2)
					return m_ActiveFadeIn;
				else
				return float3(0,0,0);
			}
			
			float4 Detail_Maskfloat4switch226_g43147( int m_switch, float4 m_Off, float4 m_Active, float4 m_ActiveInverted )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else if(m_switch ==2)
					return m_ActiveInverted;
				else
				return float4(0,0,0,0);
			}
			
			float Detail_BlendVCfloatswitch319_g43147( int m_switch, float m_Red, float m_Green, float m_Blue )
			{
				if(m_switch ==0)
					return m_Red;
				else if(m_switch ==1)
					return m_Green;
				else if(m_switch ==2)
					return m_Blue;
				else
				return float(0);
			}
			
			float3 Detail_Maskfloat3switch221_g43147( int m_switch, float3 m_Off, float3 m_Active, float3 m_ActiveInverted )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else if(m_switch ==2)
					return m_ActiveInverted;
				else
				return float3(0,0,0);
			}
			
			float3 ASEUnpackNormalRGB(float4 PackedNormal, float Scale = 1.0 )
			{
				float3 normal;
				normal.xyz = PackedNormal.rgb * 2.0 - 1.0;
				normal.xy *= Scale;
				return normal;
			}
			
			float3 _BentNormal_Spacefloat3switch6_g43151( int m_switch, float3 m_TangentSpace, float3 m_ObjectSpace )
			{
				if(m_switch ==0)
					return m_TangentSpace;
				else if(m_switch ==1)
					return m_ObjectSpace;
				else
				return float3(0,0,0);
			}
			
			float4 SmoothnessTypefloat4switch215_g43132( int m_switch, float4 m_Smoothness, float4 m_Roughness, float4 m_Geometric )
			{
				if(m_switch ==0)
					return m_Smoothness;
				else if(m_switch ==1)
					return m_Roughness;
				else if(m_switch ==2)
					return m_Geometric;
				else
				return float4(0,0,0,0);
			}
			

			void BuildSurfaceData(FragInputs fragInputs, inout GlobalSurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.specularOcclusion = 1.0;

				// surface data
				surfaceData.baseColor =					surfaceDescription.Albedo;
				surfaceData.perceptualSmoothness =		surfaceDescription.Smoothness;
				surfaceData.ambientOcclusion =			surfaceDescription.Occlusion;
				surfaceData.metallic =					surfaceDescription.Metallic;
				surfaceData.coatMask =					surfaceDescription.CoatMask;

				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceData.specularOcclusion =			surfaceDescription.SpecularOcclusion;
				#endif
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.subsurfaceMask =			surfaceDescription.SubsurfaceMask;
				#endif
				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceData.thickness =					surfaceDescription.Thickness;
				#endif
				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
				surfaceData.diffusionProfileHash =		asuint(surfaceDescription.DiffusionProfile);
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.specularColor =				surfaceDescription.Specular;
				#endif
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.anisotropy =				surfaceDescription.Anisotropy;
				#endif
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.iridescenceMask =			surfaceDescription.IridescenceMask;
				surfaceData.iridescenceThickness =		surfaceDescription.IridescenceThickness;
				#endif

				// refraction
				#ifdef _HAS_REFRACTION
				if( _EnableSSRefraction )
				{
					surfaceData.ior = surfaceDescription.RefractionIndex;
					surfaceData.transmittanceColor = surfaceDescription.RefractionColor;
					surfaceData.atDistance = surfaceDescription.RefractionDistance;

					surfaceData.transmittanceMask = ( 1.0 - surfaceDescription.Alpha );
					surfaceDescription.Alpha = 1.0;
				}
				else
				{
					surfaceData.ior = 1.0;
					surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
					surfaceData.atDistance = 1.0;
					surfaceData.transmittanceMask = 0.0;
					surfaceDescription.Alpha = 1.0;
				}
				#else
				surfaceData.ior = 1.0;
				surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
				surfaceData.atDistance = 1.0;
				surfaceData.transmittanceMask = 0.0;
				#endif


				// material features
				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
				#endif
				#ifdef ASE_LIT_CLEAR_COAT
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				// others
				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
				surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif
				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				// normals
				float3 normalTS = float3(0.0f, 0.0f, 1.0f);
				normalTS = surfaceDescription.Normal;
				GetNormalWS( fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants );

				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
				surfaceData.tangentWS = normalize( fragInputs.tangentToWorld[ 0 ].xyz );

				// decals
				#if HAVE_DECALS
				if( _EnableDecals )
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs.tangentToWorld[2], surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
				#endif

				bentNormalWS = surfaceData.normalWS;

				#ifdef ASE_BENT_NORMAL
				GetNormalWS( fragInputs, surfaceDescription.BentNormal, bentNormalWS, doubleSidedConstants );
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.tangentWS = TransformTangentToWorld( surfaceDescription.Tangent, fragInputs.tangentToWorld );
				#endif
				surfaceData.tangentWS = Orthonormalize( surfaceData.tangentWS, surfaceData.normalWS );


				#if defined(_SPECULAR_OCCLUSION_CUSTOM)
				#elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO( V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness( surfaceData.perceptualSmoothness ) );
				#elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion( ClampNdotV( dot( surfaceData.normalWS, V ) ), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness( surfaceData.perceptualSmoothness ) );
				#endif

				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
				surfaceData.perceptualSmoothness = GeometricNormalFiltering( surfaceData.perceptualSmoothness, fragInputs.tangentToWorld[ 2 ], surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold );
				#endif

				// debug
				#if defined(DEBUG_DISPLAY)
				if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				{
					surfaceData.metallic = 0;
				}
				ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
				#endif
			}

			void GetSurfaceAndBuiltinData(GlobalSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
				LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				ApplyDoubleSidedFlipOrMirror( fragInputs, doubleSidedConstants );

				#ifdef _ALPHATEST_ON
				DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#ifdef _DEPTHOFFSET_ON
				builtinData.depthOffset = surfaceDescription.DepthOffset;
				ApplyDepthOffsetPositionInput( V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput );
				#endif

				float3 bentNormalWS;
				BuildSurfaceData( fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS );

				InitBuiltinData( posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[ 2 ], fragInputs.texCoord1, fragInputs.texCoord2, builtinData );

				#ifdef _ASE_BAKEDGI
				builtinData.bakeDiffuseLighting = surfaceDescription.BakedGI;
				#endif
				#ifdef _ASE_BAKEDBACKGI
				builtinData.backBakeDiffuseLighting = surfaceDescription.BakedBackGI;
				#endif

				builtinData.emissiveColor = surfaceDescription.Emission;

				#if (SHADERPASS == SHADERPASS_DISTORTION)
				builtinData.distortion = surfaceDescription.Distortion;
				builtinData.distortionBlur = surfaceDescription.DistortionBlur;
				#else
				builtinData.distortion = float2(0.0, 0.0);
				builtinData.distortionBlur = 0.0;
				#endif

				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh )
			{
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS;

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, outputPackedVaryingsMeshToPS);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( outputPackedVaryingsMeshToPS );

				int m_switch3050_g3455 = _Global_Wind_Main_Fade_Enabled;
				int m_switch2453_g3455 = _WindMode;
				float3 m_Off2453_g3455 = float3(0,0,0);
				float3 VERTEX_POSITION_MATRIX2352_g3455 = mul( GetObjectToWorldMatrix(), float4( inputMesh.positionOS , 0.0 ) ).xyz;
				float3 break2265_g3455 = VERTEX_POSITION_MATRIX2352_g3455;
				int WIND_MODE2462_g3455 = _WindMode;
				int m_switch2458_g3455 = WIND_MODE2462_g3455;
				float m_Off2458_g3455 = 1.0;
				float m_Global2458_g3455 = ( _GlobalWindInfluenceOther * _Global_Wind_Main_Intensity );
				float m_Local2458_g3455 = _LocalWindStrength;
				float localWind_Globalfloatswitch2458_g3455 = Wind_Globalfloatswitch( m_switch2458_g3455 , m_Off2458_g3455 , m_Global2458_g3455 , m_Local2458_g3455 );
				float _WIND_STRENGHT2400_g3455 = localWind_Globalfloatswitch2458_g3455;
				int m_switch2468_g3455 = WIND_MODE2462_g3455;
				float m_Off2468_g3455 = 1.0;
				float m_Global2468_g3455 = _Global_Wind_Main_RandomOffset;
				float m_Local2468_g3455 = _LocalRandomWindOffset;
				float localWind_Globalfloatswitch2468_g3455 = Wind_Globalfloatswitch( m_switch2468_g3455 , m_Off2468_g3455 , m_Global2468_g3455 , m_Local2468_g3455 );
				float4 transform3073_g3455 = mul(GetObjectToWorldMatrix(),float4( 0,0,0,1 ));
				transform3073_g3455.xyz = GetAbsolutePositionWS((transform3073_g3455).xyz);
				float2 appendResult2307_g3455 = (float2(transform3073_g3455.x , transform3073_g3455.z));
				float dotResult2341_g3455 = dot( appendResult2307_g3455 , float2( 12.9898,78.233 ) );
				float lerpResult2238_g3455 = lerp( 0.8 , ( ( localWind_Globalfloatswitch2468_g3455 / 2.0 ) + 0.9 ) , frac( ( sin( dotResult2341_g3455 ) * 43758.55 ) ));
				float _WIND_RANDOM_OFFSET2244_g3455 = ( ( _TimeParameters.x * 0.05 ) * lerpResult2238_g3455 );
				float _WIND_TUBULENCE_RANDOM2274_g3455 = ( sin( ( ( _WIND_RANDOM_OFFSET2244_g3455 * 40.0 ) - ( VERTEX_POSITION_MATRIX2352_g3455.z / 15.0 ) ) ) * 0.5 );
				int m_switch2312_g3455 = WIND_MODE2462_g3455;
				float m_Off2312_g3455 = 1.0;
				float m_Global2312_g3455 = _Global_Wind_Main_Pulse;
				float m_Local2312_g3455 = _LocalWindPulse;
				float localWind_Globalfloatswitch2312_g3455 = Wind_Globalfloatswitch( m_switch2312_g3455 , m_Off2312_g3455 , m_Global2312_g3455 , m_Local2312_g3455 );
				float _WIND_PULSE2421_g3455 = localWind_Globalfloatswitch2312_g3455;
				float FUNC_Angle2470_g3455 = ( _WIND_STRENGHT2400_g3455 * ( 1.0 + sin( ( ( ( ( _WIND_RANDOM_OFFSET2244_g3455 * 2.0 ) + _WIND_TUBULENCE_RANDOM2274_g3455 ) - ( VERTEX_POSITION_MATRIX2352_g3455.z / 50.0 ) ) - ( inputMesh.ase_color.r / 20.0 ) ) ) ) * sqrt( inputMesh.ase_color.r ) * _WIND_PULSE2421_g3455 );
				float FUNC_Angle_SinA2424_g3455 = sin( FUNC_Angle2470_g3455 );
				float FUNC_Angle_CosA2362_g3455 = cos( FUNC_Angle2470_g3455 );
				int m_switch2456_g3455 = WIND_MODE2462_g3455;
				float m_Off2456_g3455 = 1.0;
				float m_Global2456_g3455 = _Global_Wind_Main_Direction;
				float m_Local2456_g3455 = _LocalWindDirection;
				float localWind_Globalfloatswitch2456_g3455 = Wind_Globalfloatswitch( m_switch2456_g3455 , m_Off2456_g3455 , m_Global2456_g3455 , m_Local2456_g3455 );
				float _WindDirection2249_g3455 = localWind_Globalfloatswitch2456_g3455;
				float2 localDirectionalEquation2249_g3455 = DirectionalEquation( _WindDirection2249_g3455 );
				float2 break2469_g3455 = localDirectionalEquation2249_g3455;
				float _WIND_DIRECTION_X2418_g3455 = break2469_g3455.x;
				float lerpResult2258_g3455 = lerp( break2265_g3455.x , ( ( break2265_g3455.y * FUNC_Angle_SinA2424_g3455 ) + ( break2265_g3455.x * FUNC_Angle_CosA2362_g3455 ) ) , _WIND_DIRECTION_X2418_g3455);
				float3 break2340_g3455 = VERTEX_POSITION_MATRIX2352_g3455;
				float3 break2233_g3455 = VERTEX_POSITION_MATRIX2352_g3455;
				float _WIND_DIRECTION_Y2416_g3455 = break2469_g3455.y;
				float lerpResult2275_g3455 = lerp( break2233_g3455.z , ( ( break2233_g3455.y * FUNC_Angle_SinA2424_g3455 ) + ( break2233_g3455.z * FUNC_Angle_CosA2362_g3455 ) ) , _WIND_DIRECTION_Y2416_g3455);
				float3 appendResult2235_g3455 = (float3(lerpResult2258_g3455 , ( ( break2340_g3455.y * FUNC_Angle_CosA2362_g3455 ) - ( break2340_g3455.z * FUNC_Angle_SinA2424_g3455 ) ) , lerpResult2275_g3455));
				float3 VERTEX_POSITION2282_g3455 = ( mul( GetWorldToObjectMatrix(), float4( appendResult2235_g3455 , 0.0 ) ).xyz - inputMesh.positionOS );
				float3 m_Global2453_g3455 = VERTEX_POSITION2282_g3455;
				float3 m_Local2453_g3455 = VERTEX_POSITION2282_g3455;
				float3 localWind_Globalfloat3switch2453_g3455 = Wind_Globalfloat3switch( m_switch2453_g3455 , m_Off2453_g3455 , m_Global2453_g3455 , m_Local2453_g3455 );
				float3 m_Off3050_g3455 = localWind_Globalfloat3switch2453_g3455;
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				float temp_output_3048_0_g3455 = saturate( pow( ( distance( _WorldSpaceCameraPos , ase_worldPos ) / _Global_Wind_Main_Fade_Bias ) , 5.0 ) );
				float3 m_ActiveFadeOut3050_g3455 = ( localWind_Globalfloat3switch2453_g3455 * ( 1.0 - temp_output_3048_0_g3455 ) );
				float3 m_ActiveFadeIn3050_g3455 = ( localWind_Globalfloat3switch2453_g3455 * temp_output_3048_0_g3455 );
				float3 localWind_Fadefloat3switch3050_g3455 = Wind_Fadefloat3switch3050_g3455( m_switch3050_g3455 , m_Off3050_g3455 , m_ActiveFadeOut3050_g3455 , m_ActiveFadeIn3050_g3455 );
				float3 temp_output_309_0_g38532 = localWind_Fadefloat3switch3050_g3455;
				
				outputPackedVaryingsMeshToPS.ase_texcoord5.xy = inputMesh.ase_texcoord.xy;
				outputPackedVaryingsMeshToPS.ase_color = inputMesh.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord5.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = temp_output_309_0_g38532;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS =  inputMesh.normalOS ;
				inputMesh.tangentOS =  inputMesh.tangentOS ;

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				float3 normalWS = TransformObjectToWorldNormal(inputMesh.normalOS);
				float4 tangentWS = float4(TransformObjectToWorldDir(inputMesh.tangentOS.xyz), inputMesh.tangentOS.w);

				outputPackedVaryingsMeshToPS.positionCS = TransformWorldToHClip(positionRWS);
				outputPackedVaryingsMeshToPS.interp00.xyz = positionRWS;
				outputPackedVaryingsMeshToPS.interp01.xyz = normalWS;
				outputPackedVaryingsMeshToPS.interp02.xyzw = tangentWS;
				outputPackedVaryingsMeshToPS.interp03.xyzw = inputMesh.uv1;
				outputPackedVaryingsMeshToPS.interp04.xyzw = inputMesh.uv2;
				return outputPackedVaryingsMeshToPS;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				o.uv1 = v.uv1;
				o.uv2 = v.uv2;
				o.ase_color = v.ase_color;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.uv1 = patch[0].uv1 * bary.x + patch[1].uv1 * bary.y + patch[2].uv1 * bary.z;
				o.uv2 = patch[0].uv2 * bary.x + patch[1].uv2 * bary.y + patch[2].uv2 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif

			void Frag( PackedVaryingsMeshToPS packedInput,
						OUTPUT_GBUFFER(outGBuffer)
						#ifdef _DEPTHOFFSET_ON
						, out float outputDepth : SV_Depth
						#endif
						
						)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				UNITY_SETUP_INSTANCE_ID( packedInput );
				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				input.tangentToWorld = k_identity3x3;
				float3 positionRWS = packedInput.interp00.xyz;
				float3 normalWS = packedInput.interp01.xyz;
				float4 tangentWS = packedInput.interp02.xyzw;

				input.positionSS = packedInput.positionCS;
				input.positionRWS = positionRWS;
				input.tangentToWorld = BuildTangentToWorld(tangentWS, normalWS);
				input.texCoord1 = packedInput.interp03.xyzw;
				input.texCoord2 = packedInput.interp04.xyzw;

				#if _DOUBLESIDED_ON && SHADER_STAGE_FRAGMENT
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false);
				#elif SHADER_STAGE_FRAGMENT
				#if defined(ASE_NEED_CULLFACE)
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false );
				#endif
				#endif
				half isFrontFace = input.isFrontFace;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);
				float3 V = GetWorldSpaceNormalizeViewDir(input.positionRWS);
				SurfaceData surfaceData;
				BuiltinData builtinData;

				GlobalSurfaceDescription surfaceDescription = (GlobalSurfaceDescription)0;
				float2 appendResult150_g38532 = (float2(_TilingX , _TilingY));
				float2 appendResult151_g38532 = (float2(_OffsetX , _OffsetY));
				float2 texCoord2_g43136 = packedInput.ase_texcoord5.xy * appendResult150_g38532 + appendResult151_g38532;
				float2 OUT_UV431_g38532 = texCoord2_g43136;
				float2 UV40_g43133 = OUT_UV431_g38532;
				float4 tex2DNode63_g43133 = SAMPLE_TEXTURE2D( _MainTex, sampler_trilinear_repeat, UV40_g43133 );
				float4 OUT_ALBEDO_RGBA1177_g38532 = tex2DNode63_g43133;
				float3 temp_output_7_0_g38532 = ( (_Color).rgb * (OUT_ALBEDO_RGBA1177_g38532).rgb * _Brightness );
				float4 temp_output_39_0_g43147 = ( float4( temp_output_7_0_g38532 , 0.0 ) + float4(0,0,0,0) );
				float4 Albedo_RGBA40_g43147 = temp_output_39_0_g43147;
				int m_switch226_g43147 = _EnableDetailMask;
				float2 appendResult132_g43147 = (float2(_DetailTilingXDetail , _DetailTilingYDetail));
				float2 appendResult114_g43147 = (float2(_DetailOffsetXDetail , _DetailOffsetYDetail));
				float2 texCoord67_g43147 = packedInput.ase_texcoord5.xy * appendResult132_g43147 + appendResult114_g43147;
				float4 tex2DNode45_g43147 = SAMPLE_TEXTURE2D( _DetailAlbedoMap, sampler_trilinear_repeat, texCoord67_g43147 );
				float4 ALBEDO_OUT255_g43147 = ( _ColorDetail * tex2DNode45_g43147 * _Brightness );
				float4 m_Off226_g43147 = ALBEDO_OUT255_g43147;
				float2 appendResult219_g43147 = (float2(_DetailTilingXDetailMask , _DetailTilingYDetailMask));
				float2 appendResult206_g43147 = (float2(_DetailOffsetXDetailMask , _DetailOffsetYDetailMask));
				float2 texCoord220_g43147 = packedInput.ase_texcoord5.xy * appendResult219_g43147 + appendResult206_g43147;
				float temp_output_15_0_g43150 = ( 1.0 - SAMPLE_TEXTURE2D( _DetailMaskMap, sampler_trilinear_repeat, texCoord220_g43147 ).r );
				float temp_output_26_0_g43150 = _Detail_BlendAmountMask;
				float temp_output_24_0_g43150 = _Detail_BlendHardnessMask;
				float saferPower2_g43150 = abs( max( saturate( (0.0 + (temp_output_15_0_g43150 - ( 1.0 - temp_output_26_0_g43150 )) * (temp_output_24_0_g43150 - 0.0) / (1.0 - ( 1.0 - temp_output_26_0_g43150 ))) ) , 0.0 ) );
				float temp_output_22_0_g43150 = _Detail_BlendFalloffMask;
				float temp_output_403_0_g43147 = saturate( pow( saferPower2_g43150 , ( 1.0 - temp_output_22_0_g43150 ) ) );
				float4 lerpResult225_g43147 = lerp( Albedo_RGBA40_g43147 , ALBEDO_OUT255_g43147 , temp_output_403_0_g43147);
				float4 m_Active226_g43147 = lerpResult225_g43147;
				float saferPower11_g43150 = abs( max( saturate( (1.0 + (temp_output_15_0_g43150 - temp_output_26_0_g43150) * (( 1.0 - temp_output_24_0_g43150 ) - 1.0) / (0.0 - temp_output_26_0_g43150)) ) , 0.0 ) );
				float temp_output_403_21_g43147 = saturate( pow( saferPower11_g43150 , temp_output_22_0_g43150 ) );
				float4 lerpResult408_g43147 = lerp( ALBEDO_OUT255_g43147 , Albedo_RGBA40_g43147 , temp_output_403_21_g43147);
				float4 m_ActiveInverted226_g43147 = lerpResult408_g43147;
				float4 localDetail_Maskfloat4switch226_g43147 = Detail_Maskfloat4switch226_g43147( m_switch226_g43147 , m_Off226_g43147 , m_Active226_g43147 , m_ActiveInverted226_g43147 );
				float4 Mask_Albedo258_g43147 = localDetail_Maskfloat4switch226_g43147;
				float4 break48_g43147 = temp_output_39_0_g43147;
				float Albedo_RGB300_g43147 = ( break48_g43147.x + break48_g43147.y + break48_g43147.z );
				int m_switch319_g43147 = _BlendColor;
				float m_Red319_g43147 = packedInput.ase_color.r;
				float m_Green319_g43147 = packedInput.ase_color.g;
				float m_Blue319_g43147 = packedInput.ase_color.b;
				float localDetail_BlendVCfloatswitch319_g43147 = Detail_BlendVCfloatswitch319_g43147( m_switch319_g43147 , m_Red319_g43147 , m_Green319_g43147 , m_Blue319_g43147 );
				float clampResult47_g43147 = clamp( ( ( ( ( Albedo_RGB300_g43147 - 0.5 ) * ( _DetailBlendInfluence - 0.9 ) ) + ( localDetail_BlendVCfloatswitch319_g43147 - ( _BlendHeight - 0.4 ) ) ) / _DetailBlendSmooth ) , 0.0 , 1.0 );
				float DetailBlend43_g43147 = clampResult47_g43147;
				float4 lerpResult58_g43147 = lerp( Mask_Albedo258_g43147 , Albedo_RGBA40_g43147 , DetailBlend43_g43147);
				float4 lerpResult409_g43147 = lerp( Albedo_RGBA40_g43147 , lerpResult58_g43147 , _EnableDetailMap);
				
				float4 OUT_NORMAL1178_g38532 = SAMPLE_TEXTURE2D( _BumpMap, sampler_trilinear_repeat, UV40_g43133 );
				float4 temp_output_1_0_g43120 = OUT_NORMAL1178_g38532;
				float temp_output_8_0_g43120 = _NormalStrength;
				float3 unpack52_g43120 = UnpackNormalScale( temp_output_1_0_g43120, temp_output_8_0_g43120 );
				unpack52_g43120.z = lerp( 1, unpack52_g43120.z, saturate(temp_output_8_0_g43120) );
				float3 temp_output_1478_59_g38532 = unpack52_g43120;
				float3 temp_output_38_0_g43147 = temp_output_1478_59_g38532;
				float3 Normal_XYZ260_g43147 = temp_output_38_0_g43147;
				int EnableDetailMask216_g43147 = _EnableDetailMask;
				int m_switch221_g43147 = EnableDetailMask216_g43147;
				float4 temp_output_1_0_g43148 = SAMPLE_TEXTURE2D( _DetailNormalMap, sampler_trilinear_repeat, texCoord67_g43147 );
				float temp_output_8_0_g43148 = _DetailNormalMapScale;
				float3 unpack52_g43148 = UnpackNormalScale( temp_output_1_0_g43148, temp_output_8_0_g43148 );
				unpack52_g43148.z = lerp( 1, unpack52_g43148.z, saturate(temp_output_8_0_g43148) );
				float3 Detail_Normal199_g43147 = unpack52_g43148;
				float3 m_Off221_g43147 = Detail_Normal199_g43147;
				float3 lerpResult205_g43147 = lerp( Normal_XYZ260_g43147 , Detail_Normal199_g43147 , temp_output_403_0_g43147);
				float3 m_Active221_g43147 = saturate( lerpResult205_g43147 );
				float3 lerpResult406_g43147 = lerp( Detail_Normal199_g43147 , Normal_XYZ260_g43147 , temp_output_403_21_g43147);
				float3 m_ActiveInverted221_g43147 = saturate( lerpResult406_g43147 );
				float3 localDetail_Maskfloat3switch221_g43147 = Detail_Maskfloat3switch221_g43147( m_switch221_g43147 , m_Off221_g43147 , m_Active221_g43147 , m_ActiveInverted221_g43147 );
				float3 Mask_Normal222_g43147 = localDetail_Maskfloat3switch221_g43147;
				float layeredBlendVar413_g43147 = DetailBlend43_g43147;
				float3 layeredBlend413_g43147 = ( lerp( Mask_Normal222_g43147,Normal_XYZ260_g43147 , layeredBlendVar413_g43147 ) );
				float3 normalizeResult414_g43147 = normalize( layeredBlend413_g43147 );
				float3 temp_output_416_0_g43147 = BlendNormal( normalizeResult414_g43147 , Normal_XYZ260_g43147 );
				float EnebleMode122_g43147 = _EnableDetailMap;
				float3 lerpResult410_g43147 = lerp( Normal_XYZ260_g43147 , temp_output_416_0_g43147 , EnebleMode122_g43147);
				
				int m_switch6_g43151 = _NormalMapSpace;
				float2 texCoord16_g43151 = packedInput.ase_texcoord5.xy * float2( 1,1 ) + float2( 0,0 );
				float4 temp_output_1_0_g43153 = SAMPLE_TEXTURE2D( _BentNormalMap, sampler_trilinear_repeat, texCoord16_g43151 );
				float temp_output_8_0_g43153 = _NormalStrengthBent;
				float3 unpack52_g43153 = UnpackNormalScale( temp_output_1_0_g43153, temp_output_8_0_g43153 );
				unpack52_g43153.z = lerp( 1, unpack52_g43153.z, saturate(temp_output_8_0_g43153) );
				float3 m_TangentSpace6_g43151 = unpack52_g43153;
				float temp_output_74_0_g43153 = ( 1.0 - temp_output_8_0_g43153 );
				float3 m_ObjectSpace6_g43151 = ASEUnpackNormalRGB(temp_output_1_0_g43153,temp_output_74_0_g43153);
				float3 local_BentNormal_Spacefloat3switch6_g43151 = _BentNormal_Spacefloat3switch6_g43151( m_switch6_g43151 , m_TangentSpace6_g43151 , m_ObjectSpace6_g43151 );
				
				float4 _MASK_B1440_g38532 = SAMPLE_TEXTURE2D( _MetallicGlossMap, sampler_trilinear_repeat, UV40_g43133 );
				float temp_output_1_0_g43124 = _MetallicStrength;
				
				int temp_output_223_0_g43132 = _SmoothnessSource;
				int m_switch215_g43132 = temp_output_223_0_g43132;
				float4 _MASK_G1438_g38532 = SAMPLE_TEXTURE2D( _SmoothnessMap, sampler_trilinear_repeat, UV40_g43133 );
				float4 temp_cast_11 = (_SmoothnessMin).xxxx;
				float4 temp_cast_12 = (_SmoothnessMax).xxxx;
				float4 temp_output_216_0_g43132 = (temp_cast_11 + (_MASK_G1438_g38532 - float4( 0,0,0,0 )) * (temp_cast_12 - temp_cast_11) / (float4( 1,1,1,1 ) - float4( 0,0,0,0 )));
				float4 m_Smoothness215_g43132 = temp_output_216_0_g43132;
				float4 temp_cast_13 = (_SmoothnessMin).xxxx;
				float4 temp_cast_14 = (_SmoothnessMax).xxxx;
				float4 temp_output_214_0_g43132 = ( 1.0 - temp_output_216_0_g43132 );
				float4 m_Roughness215_g43132 = temp_output_214_0_g43132;
				float4 temp_cast_15 = (_SmoothnessMin).xxxx;
				float4 temp_cast_16 = (_SmoothnessMax).xxxx;
				float3 NORMAL_WORLD_OUT164_g38532 = temp_output_1478_59_g38532;
				float3 temp_output_4_0_g43132 = NORMAL_WORLD_OUT164_g38532;
				float3 temp_output_178_0_g43132 = ddx( temp_output_4_0_g43132 );
				float dotResult195_g43132 = dot( temp_output_178_0_g43132 , temp_output_178_0_g43132 );
				float3 temp_output_175_0_g43132 = ddy( temp_output_4_0_g43132 );
				float dotResult201_g43132 = dot( temp_output_175_0_g43132 , temp_output_175_0_g43132 );
				float4 break377_g38532 = OUT_ALBEDO_RGBA1177_g38532;
				float ALBEDO_R169_g38532 = break377_g38532.r;
				float4 temp_cast_17 = (ALBEDO_R169_g38532).xxxx;
				float4 m_Geometric215_g43132 = ( sqrt( saturate( ( temp_output_216_0_g43132 + ( ( dotResult195_g43132 + dotResult201_g43132 ) * 2.0 ) ) ) ) * ( 1.0 - temp_cast_17 ) );
				float4 localSmoothnessTypefloat4switch215_g43132 = SmoothnessTypefloat4switch215_g43132( m_switch215_g43132 , m_Smoothness215_g43132 , m_Roughness215_g43132 , m_Geometric215_g43132 );
				float4 temp_output_1556_33_g38532 = localSmoothnessTypefloat4switch215_g43132;
				float4 PBR_Occlusion1641_g38532 = SAMPLE_TEXTURE2D( _OcclusionMap, sampler_trilinear_repeat, UV40_g43133 );
				float temp_output_16_0_g43125 = _OcclusionStrengthAO;
				float temp_output_65_0_g43125 = ( 1.0 - temp_output_16_0_g43125 );
				float3 appendResult69_g43125 = (float3(temp_output_65_0_g43125 , temp_output_65_0_g43125 , temp_output_65_0_g43125));
				float4 color77_g43125 = IsGammaSpace() ? float4(1,1,1,1) : float4(1,1,1,1);
				float4 temp_cast_20 = (packedInput.ase_color.a).xxxx;
				float4 lerpResult75_g43125 = lerp( color77_g43125 , temp_cast_20 , temp_output_16_0_g43125);
				float4 lerpResult83_g43125 = lerp( float4( ( ( ( (PBR_Occlusion1641_g38532).xyz - float3( 0.5,0.5,0.5 ) ) * temp_output_16_0_g43125 ) + appendResult69_g43125 ) , 0.0 ) , lerpResult75_g43125 , _OcclusionSource);
				float4 Occlusion1550_g38532 = saturate( lerpResult83_g43125 );
				
				float lerpResult3_g43155 = lerp( 0.0 , _SpecularAAScreenSpaceVariance , _EnableGeometricSpecularAA);
				
				float lerpResult4_g43155 = lerp( 0.0 , _SpecularAAThreshold , _EnableGeometricSpecularAA);
				
				surfaceDescription.Albedo = lerpResult409_g43147.xyz;
				surfaceDescription.Normal = lerpResult410_g43147;
				surfaceDescription.BentNormal = local_BentNormal_Spacefloat3switch6_g43151;
				surfaceDescription.CoatMask = 0;
				surfaceDescription.Metallic = ( _MASK_B1440_g38532.r * temp_output_1_0_g43124 );

				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceDescription.Specular = 0;
				#endif

				surfaceDescription.Emission = 0;
				surfaceDescription.Smoothness = ( temp_output_1556_33_g38532 * Occlusion1550_g38532 ).x;
				surfaceDescription.Occlusion = saturate( lerpResult83_g43125 ).r;
				surfaceDescription.Alpha = break377_g38532.a;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = _AlphaCutoff;
				#endif

				#ifdef _ALPHATEST_SHADOW_ON
				surfaceDescription.AlphaClipThresholdShadow = _AlphaCutoffShadow;
				#endif

				surfaceDescription.AlphaClipThresholdDepthPrepass = 0.5;
				surfaceDescription.AlphaClipThresholdDepthPostpass = 0.5;

				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
				surfaceDescription.SpecularAAScreenSpaceVariance = lerpResult3_g43155;
				surfaceDescription.SpecularAAThreshold = lerpResult4_g43155;
				#endif

				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceDescription.SpecularOcclusion = 0;
				#endif

				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceDescription.Thickness = 1;
				#endif

				#ifdef _HAS_REFRACTION
				surfaceDescription.RefractionIndex = 1;
				surfaceDescription.RefractionColor = float3( 1, 1, 1 );
				surfaceDescription.RefractionDistance = 0;
				#endif

				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceDescription.SubsurfaceMask = 1;
				#endif

				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
				surfaceDescription.DiffusionProfile = 0;
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceDescription.Anisotropy = 1;
				surfaceDescription.Tangent = float3( 1, 0, 0 );
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceDescription.IridescenceMask = 0;
				surfaceDescription.IridescenceThickness = 0;
				#endif

				#ifdef _ASE_DISTORTION
				surfaceDescription.Distortion = float2 ( 2, -1 );
				surfaceDescription.DistortionBlur = 1;
				#endif

				#ifdef _ASE_BAKEDGI
				surfaceDescription.BakedGI = 0;
				#endif
				#ifdef _ASE_BAKEDBACKGI
				surfaceDescription.BakedBackGI = 0;
				#endif

				#ifdef _DEPTHOFFSET_ON
				surfaceDescription.DepthOffset = 0;
				#endif

				GetSurfaceAndBuiltinData( surfaceDescription, input, V, posInput, surfaceData, builtinData );
				ENCODE_INTO_GBUFFER( surfaceData, builtinData, posInput.positionSS, outGBuffer );
				#ifdef _DEPTHOFFSET_ON
				outputDepth = posInput.deviceDepth;
				#endif
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "META"
			Tags { "LightMode"="Meta" }

			Cull Off

			HLSLPROGRAM

			#define _ALPHATEST_SHADOW_ON 1
			#define _ENABLE_GEOMETRIC_SPECULAR_AA 1
			#define _SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL 1
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_BENT_NORMAL 1
			#define _AMBIENT_OCCLUSION 1
			#define HAVE_MESH_MODIFICATION
			#define ASE_SRP_VERSION 100400
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local _DOUBLESIDED_ON
			#pragma shader_feature_local _ _BLENDMODE_ALPHA _BLENDMODE_ADD _BLENDMODE_PRE_MULTIPLY
			#pragma shader_feature_local _ENABLE_FOG_ON_TRANSPARENT
			#pragma shader_feature_local _ALPHATEST_ON

			#define SHADERPASS SHADERPASS_LIGHT_TRANSPORT

			#pragma vertex Vert
			#pragma fragment Frag

			//#define UNITY_MATERIAL_LIT

			#if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
			#endif

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#ifdef DEBUG_DISPLAY
				#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
			#endif
			
			CBUFFER_START( UnityPerMaterial )
			float4 _Smoothness;
			half4 _ColorDetail;
			float4 _Color;
			float _SmoothnessMax;
			half _DetailOffsetXDetailMask;
			half _DetailOffsetYDetailMask;
			half _Detail_BlendAmountMask;
			half _Detail_BlendHardnessMask;
			half _Detail_BlendFalloffMask;
			half _DetailBlendInfluence;
			int _BlendColor;
			half _BlendHeight;
			half _DetailBlendSmooth;
			float _EnableDetailMap;
			half _NormalStrength;
			half _DetailNormalMapScale;
			int _NormalMapSpace;
			half _NormalStrengthBent;
			float _MetallicStrength;
			int _SmoothnessSource;
			float _OcclusionStrengthAO;
			float _OcclusionSource;
			float _AlphaCutoffShadow;
			float _SpecularAAScreenSpaceVariance;
			float _DetailTilingYDetailMask;
			float _DetailTilingXDetailMask;
			half _DetailOffsetXDetail;
			float _EnableGeometricSpecularAA;
			float _SmoothnessMin;
			float _DoubleSidedGIMode;
			half _EmissionFlags;
			float _TransparentWritingMotionVec;
			float _EnableBlendModePreserveSpecularLighting;
			float _AlphaToMaskInspectorValue;
			int _OpaqueCullMode;
			int _WindMode;
			float _GlobalWindInfluenceOther;
			float _LocalWindStrength;
			float _LocalRandomWindOffset;
			float _LocalWindPulse;
			float _LocalWindDirection;
			float _TilingX;
			float _TilingY;
			float _OffsetX;
			float _OffsetY;
			half _Brightness;
			int _EnableDetailMask;
			float _DetailTilingXDetail;
			float _DetailTilingYDetail;
			half _DetailOffsetYDetail;
			float _SpecularAAThreshold;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			int _Global_Wind_Main_Fade_Enabled;
			float _Global_Wind_Main_Intensity;
			float _Global_Wind_Main_RandomOffset;
			float _Global_Wind_Main_Pulse;
			float _Global_Wind_Main_Direction;
			float _Global_Wind_Main_Fade_Bias;
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_trilinear_repeat);
			TEXTURE2D(_DetailAlbedoMap);
			TEXTURE2D(_DetailMaskMap);
			TEXTURE2D(_BumpMap);
			TEXTURE2D(_DetailNormalMap);
			TEXTURE2D(_BentNormalMap);
			TEXTURE2D(_MetallicGlossMap);
			TEXTURE2D(_SmoothnessMap);
			TEXTURE2D(_OcclusionMap);


			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_FRAG_COLOR
			#pragma instancing_options procedural:SetupNatureRenderer forwardadd
			#pragma multi_compile GPU_FRUSTUM_ON __
			#include "Nature Renderer.cginc"
			#pragma multi_compile_local _ NATURE_RENDERER
			#pragma shader_feature_local _ALPHATOMASK_ON
			#pragma shader_feature_local _ _VERTEX_DISPLACEMENT _PIXEL_DISPLACEMENT
			#pragma shader_feature_local_vertex _VERTEX_DISPLACEMENT_LOCK_OBJECT_SCALE
			#pragma shader_feature_local _DISPLACEMENT_LOCK_TILING_SCALE
			#pragma shader_feature_local_fragment _PIXEL_DISPLACEMENT_LOCK_OBJECT_SCALE


			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
				#define ASE_NEED_CULLFACE 1
			#endif

			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 uv0 : TEXCOORD0;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				float4 positionCS : SV_Position;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};

			float Wind_Globalfloatswitch( int m_switch, float m_Off, float m_Global, float m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float(0);
			}
			
			float2 DirectionalEquation( float _WindDirection )
			{
				float d = _WindDirection * 0.0174532924;
				float xL = cos(d) + 1 / 2;
				float zL = sin(d) + 1 / 2;
				return float2(zL,xL);
			}
			
			float3 Wind_Globalfloat3switch( int m_switch, float3 m_Off, float3 m_Global, float3 m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float3(0,0,0);
			}
			
			float3 Wind_Fadefloat3switch3050_g3455( int m_switch, float3 m_Off, float3 m_ActiveFadeOut, float3 m_ActiveFadeIn )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_ActiveFadeOut;
				else if(m_switch ==2)
					return m_ActiveFadeIn;
				else
				return float3(0,0,0);
			}
			
			float4 Detail_Maskfloat4switch226_g43147( int m_switch, float4 m_Off, float4 m_Active, float4 m_ActiveInverted )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else if(m_switch ==2)
					return m_ActiveInverted;
				else
				return float4(0,0,0,0);
			}
			
			float Detail_BlendVCfloatswitch319_g43147( int m_switch, float m_Red, float m_Green, float m_Blue )
			{
				if(m_switch ==0)
					return m_Red;
				else if(m_switch ==1)
					return m_Green;
				else if(m_switch ==2)
					return m_Blue;
				else
				return float(0);
			}
			
			float3 Detail_Maskfloat3switch221_g43147( int m_switch, float3 m_Off, float3 m_Active, float3 m_ActiveInverted )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else if(m_switch ==2)
					return m_ActiveInverted;
				else
				return float3(0,0,0);
			}
			
			float3 ASEUnpackNormalRGB(float4 PackedNormal, float Scale = 1.0 )
			{
				float3 normal;
				normal.xyz = PackedNormal.rgb * 2.0 - 1.0;
				normal.xy *= Scale;
				return normal;
			}
			
			float3 _BentNormal_Spacefloat3switch6_g43151( int m_switch, float3 m_TangentSpace, float3 m_ObjectSpace )
			{
				if(m_switch ==0)
					return m_TangentSpace;
				else if(m_switch ==1)
					return m_ObjectSpace;
				else
				return float3(0,0,0);
			}
			
			float4 SmoothnessTypefloat4switch215_g43132( int m_switch, float4 m_Smoothness, float4 m_Roughness, float4 m_Geometric )
			{
				if(m_switch ==0)
					return m_Smoothness;
				else if(m_switch ==1)
					return m_Roughness;
				else if(m_switch ==2)
					return m_Geometric;
				else
				return float4(0,0,0,0);
			}
			

			void BuildSurfaceData(FragInputs fragInputs, inout GlobalSurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.specularOcclusion = 1.0;

				// surface data
				surfaceData.baseColor =					surfaceDescription.Albedo;
				surfaceData.perceptualSmoothness =		surfaceDescription.Smoothness;
				surfaceData.ambientOcclusion =			surfaceDescription.Occlusion;
				surfaceData.metallic =					surfaceDescription.Metallic;
				surfaceData.coatMask =					surfaceDescription.CoatMask;

				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceData.specularOcclusion =			surfaceDescription.SpecularOcclusion;
				#endif
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.subsurfaceMask =			surfaceDescription.SubsurfaceMask;
				#endif
				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceData.thickness =					surfaceDescription.Thickness;
				#endif
				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
				surfaceData.diffusionProfileHash =		asuint(surfaceDescription.DiffusionProfile);
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.specularColor =				surfaceDescription.Specular;
				#endif
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.anisotropy =				surfaceDescription.Anisotropy;
				#endif
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.iridescenceMask =			surfaceDescription.IridescenceMask;
				surfaceData.iridescenceThickness =		surfaceDescription.IridescenceThickness;
				#endif

				// refraction
				#ifdef _HAS_REFRACTION
				if( _EnableSSRefraction )
				{
					surfaceData.ior = surfaceDescription.RefractionIndex;
					surfaceData.transmittanceColor = surfaceDescription.RefractionColor;
					surfaceData.atDistance = surfaceDescription.RefractionDistance;

					surfaceData.transmittanceMask = ( 1.0 - surfaceDescription.Alpha );
					surfaceDescription.Alpha = 1.0;
				}
				else
				{
					surfaceData.ior = 1.0;
					surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
					surfaceData.atDistance = 1.0;
					surfaceData.transmittanceMask = 0.0;
					surfaceDescription.Alpha = 1.0;
				}
				#else
				surfaceData.ior = 1.0;
				surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
				surfaceData.atDistance = 1.0;
				surfaceData.transmittanceMask = 0.0;
				#endif


				// material features
				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
				#endif
				#ifdef ASE_LIT_CLEAR_COAT
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				// others
				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
				surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif
				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				// normals
				float3 normalTS = float3(0.0f, 0.0f, 1.0f);
				normalTS = surfaceDescription.Normal;
				GetNormalWS( fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants );

				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
				surfaceData.tangentWS = normalize( fragInputs.tangentToWorld[ 0 ].xyz );

				// decals
				#if HAVE_DECALS
				if( _EnableDecals )
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs.tangentToWorld[2], surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
				#endif

				bentNormalWS = surfaceData.normalWS;
				
				#ifdef ASE_BENT_NORMAL
				GetNormalWS( fragInputs, surfaceDescription.BentNormal, bentNormalWS, doubleSidedConstants );
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.tangentWS = TransformTangentToWorld( surfaceDescription.Tangent, fragInputs.tangentToWorld );
				#endif
				surfaceData.tangentWS = Orthonormalize( surfaceData.tangentWS, surfaceData.normalWS );


				#if defined(_SPECULAR_OCCLUSION_CUSTOM)
				#elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO( V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness( surfaceData.perceptualSmoothness ) );
				#elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion( ClampNdotV( dot( surfaceData.normalWS, V ) ), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness( surfaceData.perceptualSmoothness ) );
				#endif

				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
				surfaceData.perceptualSmoothness = GeometricNormalFiltering( surfaceData.perceptualSmoothness, fragInputs.tangentToWorld[ 2 ], surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold );
				#endif

				// debug
				#if defined(DEBUG_DISPLAY)
				if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				{
					surfaceData.metallic = 0;
				}
				ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
				#endif
			}

			void GetSurfaceAndBuiltinData(GlobalSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
				LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				ApplyDoubleSidedFlipOrMirror( fragInputs, doubleSidedConstants );

				#ifdef _ALPHATEST_ON
				DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#ifdef _DEPTHOFFSET_ON
				builtinData.depthOffset = surfaceDescription.DepthOffset;
				ApplyDepthOffsetPositionInput( V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput );
				#endif

				float3 bentNormalWS;
				BuildSurfaceData( fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS );

				InitBuiltinData( posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[ 2 ], fragInputs.texCoord1, fragInputs.texCoord2, builtinData );

				builtinData.emissiveColor = surfaceDescription.Emission;

				#if (SHADERPASS == SHADERPASS_DISTORTION)
				builtinData.distortion = surfaceDescription.Distortion;
				builtinData.distortionBlur = surfaceDescription.DistortionBlur;
				#else
				builtinData.distortion = float2(0.0, 0.0);
				builtinData.distortionBlur = 0.0;
				#endif

				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			CBUFFER_START(UnityMetaPass)
			bool4 unity_MetaVertexControl;
			bool4 unity_MetaFragmentControl;
			CBUFFER_END

			float unity_OneOverOutputBoost;
			float unity_MaxOutputValue;

			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh  )
			{
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS;

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, outputPackedVaryingsMeshToPS);

				int m_switch3050_g3455 = _Global_Wind_Main_Fade_Enabled;
				int m_switch2453_g3455 = _WindMode;
				float3 m_Off2453_g3455 = float3(0,0,0);
				float3 VERTEX_POSITION_MATRIX2352_g3455 = mul( GetObjectToWorldMatrix(), float4( inputMesh.positionOS , 0.0 ) ).xyz;
				float3 break2265_g3455 = VERTEX_POSITION_MATRIX2352_g3455;
				int WIND_MODE2462_g3455 = _WindMode;
				int m_switch2458_g3455 = WIND_MODE2462_g3455;
				float m_Off2458_g3455 = 1.0;
				float m_Global2458_g3455 = ( _GlobalWindInfluenceOther * _Global_Wind_Main_Intensity );
				float m_Local2458_g3455 = _LocalWindStrength;
				float localWind_Globalfloatswitch2458_g3455 = Wind_Globalfloatswitch( m_switch2458_g3455 , m_Off2458_g3455 , m_Global2458_g3455 , m_Local2458_g3455 );
				float _WIND_STRENGHT2400_g3455 = localWind_Globalfloatswitch2458_g3455;
				int m_switch2468_g3455 = WIND_MODE2462_g3455;
				float m_Off2468_g3455 = 1.0;
				float m_Global2468_g3455 = _Global_Wind_Main_RandomOffset;
				float m_Local2468_g3455 = _LocalRandomWindOffset;
				float localWind_Globalfloatswitch2468_g3455 = Wind_Globalfloatswitch( m_switch2468_g3455 , m_Off2468_g3455 , m_Global2468_g3455 , m_Local2468_g3455 );
				float4 transform3073_g3455 = mul(GetObjectToWorldMatrix(),float4( 0,0,0,1 ));
				transform3073_g3455.xyz = GetAbsolutePositionWS((transform3073_g3455).xyz);
				float2 appendResult2307_g3455 = (float2(transform3073_g3455.x , transform3073_g3455.z));
				float dotResult2341_g3455 = dot( appendResult2307_g3455 , float2( 12.9898,78.233 ) );
				float lerpResult2238_g3455 = lerp( 0.8 , ( ( localWind_Globalfloatswitch2468_g3455 / 2.0 ) + 0.9 ) , frac( ( sin( dotResult2341_g3455 ) * 43758.55 ) ));
				float _WIND_RANDOM_OFFSET2244_g3455 = ( ( _TimeParameters.x * 0.05 ) * lerpResult2238_g3455 );
				float _WIND_TUBULENCE_RANDOM2274_g3455 = ( sin( ( ( _WIND_RANDOM_OFFSET2244_g3455 * 40.0 ) - ( VERTEX_POSITION_MATRIX2352_g3455.z / 15.0 ) ) ) * 0.5 );
				int m_switch2312_g3455 = WIND_MODE2462_g3455;
				float m_Off2312_g3455 = 1.0;
				float m_Global2312_g3455 = _Global_Wind_Main_Pulse;
				float m_Local2312_g3455 = _LocalWindPulse;
				float localWind_Globalfloatswitch2312_g3455 = Wind_Globalfloatswitch( m_switch2312_g3455 , m_Off2312_g3455 , m_Global2312_g3455 , m_Local2312_g3455 );
				float _WIND_PULSE2421_g3455 = localWind_Globalfloatswitch2312_g3455;
				float FUNC_Angle2470_g3455 = ( _WIND_STRENGHT2400_g3455 * ( 1.0 + sin( ( ( ( ( _WIND_RANDOM_OFFSET2244_g3455 * 2.0 ) + _WIND_TUBULENCE_RANDOM2274_g3455 ) - ( VERTEX_POSITION_MATRIX2352_g3455.z / 50.0 ) ) - ( inputMesh.ase_color.r / 20.0 ) ) ) ) * sqrt( inputMesh.ase_color.r ) * _WIND_PULSE2421_g3455 );
				float FUNC_Angle_SinA2424_g3455 = sin( FUNC_Angle2470_g3455 );
				float FUNC_Angle_CosA2362_g3455 = cos( FUNC_Angle2470_g3455 );
				int m_switch2456_g3455 = WIND_MODE2462_g3455;
				float m_Off2456_g3455 = 1.0;
				float m_Global2456_g3455 = _Global_Wind_Main_Direction;
				float m_Local2456_g3455 = _LocalWindDirection;
				float localWind_Globalfloatswitch2456_g3455 = Wind_Globalfloatswitch( m_switch2456_g3455 , m_Off2456_g3455 , m_Global2456_g3455 , m_Local2456_g3455 );
				float _WindDirection2249_g3455 = localWind_Globalfloatswitch2456_g3455;
				float2 localDirectionalEquation2249_g3455 = DirectionalEquation( _WindDirection2249_g3455 );
				float2 break2469_g3455 = localDirectionalEquation2249_g3455;
				float _WIND_DIRECTION_X2418_g3455 = break2469_g3455.x;
				float lerpResult2258_g3455 = lerp( break2265_g3455.x , ( ( break2265_g3455.y * FUNC_Angle_SinA2424_g3455 ) + ( break2265_g3455.x * FUNC_Angle_CosA2362_g3455 ) ) , _WIND_DIRECTION_X2418_g3455);
				float3 break2340_g3455 = VERTEX_POSITION_MATRIX2352_g3455;
				float3 break2233_g3455 = VERTEX_POSITION_MATRIX2352_g3455;
				float _WIND_DIRECTION_Y2416_g3455 = break2469_g3455.y;
				float lerpResult2275_g3455 = lerp( break2233_g3455.z , ( ( break2233_g3455.y * FUNC_Angle_SinA2424_g3455 ) + ( break2233_g3455.z * FUNC_Angle_CosA2362_g3455 ) ) , _WIND_DIRECTION_Y2416_g3455);
				float3 appendResult2235_g3455 = (float3(lerpResult2258_g3455 , ( ( break2340_g3455.y * FUNC_Angle_CosA2362_g3455 ) - ( break2340_g3455.z * FUNC_Angle_SinA2424_g3455 ) ) , lerpResult2275_g3455));
				float3 VERTEX_POSITION2282_g3455 = ( mul( GetWorldToObjectMatrix(), float4( appendResult2235_g3455 , 0.0 ) ).xyz - inputMesh.positionOS );
				float3 m_Global2453_g3455 = VERTEX_POSITION2282_g3455;
				float3 m_Local2453_g3455 = VERTEX_POSITION2282_g3455;
				float3 localWind_Globalfloat3switch2453_g3455 = Wind_Globalfloat3switch( m_switch2453_g3455 , m_Off2453_g3455 , m_Global2453_g3455 , m_Local2453_g3455 );
				float3 m_Off3050_g3455 = localWind_Globalfloat3switch2453_g3455;
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				float temp_output_3048_0_g3455 = saturate( pow( ( distance( _WorldSpaceCameraPos , ase_worldPos ) / _Global_Wind_Main_Fade_Bias ) , 5.0 ) );
				float3 m_ActiveFadeOut3050_g3455 = ( localWind_Globalfloat3switch2453_g3455 * ( 1.0 - temp_output_3048_0_g3455 ) );
				float3 m_ActiveFadeIn3050_g3455 = ( localWind_Globalfloat3switch2453_g3455 * temp_output_3048_0_g3455 );
				float3 localWind_Fadefloat3switch3050_g3455 = Wind_Fadefloat3switch3050_g3455( m_switch3050_g3455 , m_Off3050_g3455 , m_ActiveFadeOut3050_g3455 , m_ActiveFadeIn3050_g3455 );
				float3 temp_output_309_0_g38532 = localWind_Fadefloat3switch3050_g3455;
				
				outputPackedVaryingsMeshToPS.ase_texcoord.xy = inputMesh.uv0.xy;
				outputPackedVaryingsMeshToPS.ase_color = inputMesh.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = temp_output_309_0_g38532;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS =  inputMesh.normalOS ;
				inputMesh.tangentOS =  inputMesh.tangentOS ;

				float2 uv = float2(0.0, 0.0);
				if (unity_MetaVertexControl.x)
				{
					uv = inputMesh.uv1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
				}
				else if (unity_MetaVertexControl.y)
				{
					uv = inputMesh.uv2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
				}

				outputPackedVaryingsMeshToPS.positionCS = float4(uv * 2.0 - 1.0, inputMesh.positionOS.z > 0 ? 1.0e-4 : 0.0, 1.0);
				return outputPackedVaryingsMeshToPS;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 uv0 : TEXCOORD0;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				o.uv0 = v.uv0;
				o.uv1 = v.uv1;
				o.uv2 = v.uv2;
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.uv0 = patch[0].uv0 * bary.x + patch[1].uv0 * bary.y + patch[2].uv0 * bary.z;
				o.uv1 = patch[0].uv1 * bary.x + patch[1].uv1 * bary.y + patch[2].uv1 * bary.z;
				o.uv2 = patch[0].uv2 * bary.x + patch[1].uv2 * bary.y + patch[2].uv2 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif

			float4 Frag(PackedVaryingsMeshToPS packedInput  ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID( packedInput );
				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.positionCS;

				#if _DOUBLESIDED_ON && SHADER_STAGE_FRAGMENT
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false);
				#elif SHADER_STAGE_FRAGMENT
				#if defined(ASE_NEED_CULLFACE)
				input.isFrontFace = IS_FRONT_VFACE(packedInput.cullFace, true, false);
				#endif
				#endif
				half isFrontFace = input.isFrontFace;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);
				float3 V = float3(1.0, 1.0, 1.0);

				SurfaceData surfaceData;
				BuiltinData builtinData;
				GlobalSurfaceDescription surfaceDescription = (GlobalSurfaceDescription)0;
				float2 appendResult150_g38532 = (float2(_TilingX , _TilingY));
				float2 appendResult151_g38532 = (float2(_OffsetX , _OffsetY));
				float2 texCoord2_g43136 = packedInput.ase_texcoord.xy * appendResult150_g38532 + appendResult151_g38532;
				float2 OUT_UV431_g38532 = texCoord2_g43136;
				float2 UV40_g43133 = OUT_UV431_g38532;
				float4 tex2DNode63_g43133 = SAMPLE_TEXTURE2D( _MainTex, sampler_trilinear_repeat, UV40_g43133 );
				float4 OUT_ALBEDO_RGBA1177_g38532 = tex2DNode63_g43133;
				float3 temp_output_7_0_g38532 = ( (_Color).rgb * (OUT_ALBEDO_RGBA1177_g38532).rgb * _Brightness );
				float4 temp_output_39_0_g43147 = ( float4( temp_output_7_0_g38532 , 0.0 ) + float4(0,0,0,0) );
				float4 Albedo_RGBA40_g43147 = temp_output_39_0_g43147;
				int m_switch226_g43147 = _EnableDetailMask;
				float2 appendResult132_g43147 = (float2(_DetailTilingXDetail , _DetailTilingYDetail));
				float2 appendResult114_g43147 = (float2(_DetailOffsetXDetail , _DetailOffsetYDetail));
				float2 texCoord67_g43147 = packedInput.ase_texcoord.xy * appendResult132_g43147 + appendResult114_g43147;
				float4 tex2DNode45_g43147 = SAMPLE_TEXTURE2D( _DetailAlbedoMap, sampler_trilinear_repeat, texCoord67_g43147 );
				float4 ALBEDO_OUT255_g43147 = ( _ColorDetail * tex2DNode45_g43147 * _Brightness );
				float4 m_Off226_g43147 = ALBEDO_OUT255_g43147;
				float2 appendResult219_g43147 = (float2(_DetailTilingXDetailMask , _DetailTilingYDetailMask));
				float2 appendResult206_g43147 = (float2(_DetailOffsetXDetailMask , _DetailOffsetYDetailMask));
				float2 texCoord220_g43147 = packedInput.ase_texcoord.xy * appendResult219_g43147 + appendResult206_g43147;
				float temp_output_15_0_g43150 = ( 1.0 - SAMPLE_TEXTURE2D( _DetailMaskMap, sampler_trilinear_repeat, texCoord220_g43147 ).r );
				float temp_output_26_0_g43150 = _Detail_BlendAmountMask;
				float temp_output_24_0_g43150 = _Detail_BlendHardnessMask;
				float saferPower2_g43150 = abs( max( saturate( (0.0 + (temp_output_15_0_g43150 - ( 1.0 - temp_output_26_0_g43150 )) * (temp_output_24_0_g43150 - 0.0) / (1.0 - ( 1.0 - temp_output_26_0_g43150 ))) ) , 0.0 ) );
				float temp_output_22_0_g43150 = _Detail_BlendFalloffMask;
				float temp_output_403_0_g43147 = saturate( pow( saferPower2_g43150 , ( 1.0 - temp_output_22_0_g43150 ) ) );
				float4 lerpResult225_g43147 = lerp( Albedo_RGBA40_g43147 , ALBEDO_OUT255_g43147 , temp_output_403_0_g43147);
				float4 m_Active226_g43147 = lerpResult225_g43147;
				float saferPower11_g43150 = abs( max( saturate( (1.0 + (temp_output_15_0_g43150 - temp_output_26_0_g43150) * (( 1.0 - temp_output_24_0_g43150 ) - 1.0) / (0.0 - temp_output_26_0_g43150)) ) , 0.0 ) );
				float temp_output_403_21_g43147 = saturate( pow( saferPower11_g43150 , temp_output_22_0_g43150 ) );
				float4 lerpResult408_g43147 = lerp( ALBEDO_OUT255_g43147 , Albedo_RGBA40_g43147 , temp_output_403_21_g43147);
				float4 m_ActiveInverted226_g43147 = lerpResult408_g43147;
				float4 localDetail_Maskfloat4switch226_g43147 = Detail_Maskfloat4switch226_g43147( m_switch226_g43147 , m_Off226_g43147 , m_Active226_g43147 , m_ActiveInverted226_g43147 );
				float4 Mask_Albedo258_g43147 = localDetail_Maskfloat4switch226_g43147;
				float4 break48_g43147 = temp_output_39_0_g43147;
				float Albedo_RGB300_g43147 = ( break48_g43147.x + break48_g43147.y + break48_g43147.z );
				int m_switch319_g43147 = _BlendColor;
				float m_Red319_g43147 = packedInput.ase_color.r;
				float m_Green319_g43147 = packedInput.ase_color.g;
				float m_Blue319_g43147 = packedInput.ase_color.b;
				float localDetail_BlendVCfloatswitch319_g43147 = Detail_BlendVCfloatswitch319_g43147( m_switch319_g43147 , m_Red319_g43147 , m_Green319_g43147 , m_Blue319_g43147 );
				float clampResult47_g43147 = clamp( ( ( ( ( Albedo_RGB300_g43147 - 0.5 ) * ( _DetailBlendInfluence - 0.9 ) ) + ( localDetail_BlendVCfloatswitch319_g43147 - ( _BlendHeight - 0.4 ) ) ) / _DetailBlendSmooth ) , 0.0 , 1.0 );
				float DetailBlend43_g43147 = clampResult47_g43147;
				float4 lerpResult58_g43147 = lerp( Mask_Albedo258_g43147 , Albedo_RGBA40_g43147 , DetailBlend43_g43147);
				float4 lerpResult409_g43147 = lerp( Albedo_RGBA40_g43147 , lerpResult58_g43147 , _EnableDetailMap);
				
				float4 OUT_NORMAL1178_g38532 = SAMPLE_TEXTURE2D( _BumpMap, sampler_trilinear_repeat, UV40_g43133 );
				float4 temp_output_1_0_g43120 = OUT_NORMAL1178_g38532;
				float temp_output_8_0_g43120 = _NormalStrength;
				float3 unpack52_g43120 = UnpackNormalScale( temp_output_1_0_g43120, temp_output_8_0_g43120 );
				unpack52_g43120.z = lerp( 1, unpack52_g43120.z, saturate(temp_output_8_0_g43120) );
				float3 temp_output_1478_59_g38532 = unpack52_g43120;
				float3 temp_output_38_0_g43147 = temp_output_1478_59_g38532;
				float3 Normal_XYZ260_g43147 = temp_output_38_0_g43147;
				int EnableDetailMask216_g43147 = _EnableDetailMask;
				int m_switch221_g43147 = EnableDetailMask216_g43147;
				float4 temp_output_1_0_g43148 = SAMPLE_TEXTURE2D( _DetailNormalMap, sampler_trilinear_repeat, texCoord67_g43147 );
				float temp_output_8_0_g43148 = _DetailNormalMapScale;
				float3 unpack52_g43148 = UnpackNormalScale( temp_output_1_0_g43148, temp_output_8_0_g43148 );
				unpack52_g43148.z = lerp( 1, unpack52_g43148.z, saturate(temp_output_8_0_g43148) );
				float3 Detail_Normal199_g43147 = unpack52_g43148;
				float3 m_Off221_g43147 = Detail_Normal199_g43147;
				float3 lerpResult205_g43147 = lerp( Normal_XYZ260_g43147 , Detail_Normal199_g43147 , temp_output_403_0_g43147);
				float3 m_Active221_g43147 = saturate( lerpResult205_g43147 );
				float3 lerpResult406_g43147 = lerp( Detail_Normal199_g43147 , Normal_XYZ260_g43147 , temp_output_403_21_g43147);
				float3 m_ActiveInverted221_g43147 = saturate( lerpResult406_g43147 );
				float3 localDetail_Maskfloat3switch221_g43147 = Detail_Maskfloat3switch221_g43147( m_switch221_g43147 , m_Off221_g43147 , m_Active221_g43147 , m_ActiveInverted221_g43147 );
				float3 Mask_Normal222_g43147 = localDetail_Maskfloat3switch221_g43147;
				float layeredBlendVar413_g43147 = DetailBlend43_g43147;
				float3 layeredBlend413_g43147 = ( lerp( Mask_Normal222_g43147,Normal_XYZ260_g43147 , layeredBlendVar413_g43147 ) );
				float3 normalizeResult414_g43147 = normalize( layeredBlend413_g43147 );
				float3 temp_output_416_0_g43147 = BlendNormal( normalizeResult414_g43147 , Normal_XYZ260_g43147 );
				float EnebleMode122_g43147 = _EnableDetailMap;
				float3 lerpResult410_g43147 = lerp( Normal_XYZ260_g43147 , temp_output_416_0_g43147 , EnebleMode122_g43147);
				
				int m_switch6_g43151 = _NormalMapSpace;
				float2 texCoord16_g43151 = packedInput.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float4 temp_output_1_0_g43153 = SAMPLE_TEXTURE2D( _BentNormalMap, sampler_trilinear_repeat, texCoord16_g43151 );
				float temp_output_8_0_g43153 = _NormalStrengthBent;
				float3 unpack52_g43153 = UnpackNormalScale( temp_output_1_0_g43153, temp_output_8_0_g43153 );
				unpack52_g43153.z = lerp( 1, unpack52_g43153.z, saturate(temp_output_8_0_g43153) );
				float3 m_TangentSpace6_g43151 = unpack52_g43153;
				float temp_output_74_0_g43153 = ( 1.0 - temp_output_8_0_g43153 );
				float3 m_ObjectSpace6_g43151 = ASEUnpackNormalRGB(temp_output_1_0_g43153,temp_output_74_0_g43153);
				float3 local_BentNormal_Spacefloat3switch6_g43151 = _BentNormal_Spacefloat3switch6_g43151( m_switch6_g43151 , m_TangentSpace6_g43151 , m_ObjectSpace6_g43151 );
				
				float4 _MASK_B1440_g38532 = SAMPLE_TEXTURE2D( _MetallicGlossMap, sampler_trilinear_repeat, UV40_g43133 );
				float temp_output_1_0_g43124 = _MetallicStrength;
				
				int temp_output_223_0_g43132 = _SmoothnessSource;
				int m_switch215_g43132 = temp_output_223_0_g43132;
				float4 _MASK_G1438_g38532 = SAMPLE_TEXTURE2D( _SmoothnessMap, sampler_trilinear_repeat, UV40_g43133 );
				float4 temp_cast_11 = (_SmoothnessMin).xxxx;
				float4 temp_cast_12 = (_SmoothnessMax).xxxx;
				float4 temp_output_216_0_g43132 = (temp_cast_11 + (_MASK_G1438_g38532 - float4( 0,0,0,0 )) * (temp_cast_12 - temp_cast_11) / (float4( 1,1,1,1 ) - float4( 0,0,0,0 )));
				float4 m_Smoothness215_g43132 = temp_output_216_0_g43132;
				float4 temp_cast_13 = (_SmoothnessMin).xxxx;
				float4 temp_cast_14 = (_SmoothnessMax).xxxx;
				float4 temp_output_214_0_g43132 = ( 1.0 - temp_output_216_0_g43132 );
				float4 m_Roughness215_g43132 = temp_output_214_0_g43132;
				float4 temp_cast_15 = (_SmoothnessMin).xxxx;
				float4 temp_cast_16 = (_SmoothnessMax).xxxx;
				float3 NORMAL_WORLD_OUT164_g38532 = temp_output_1478_59_g38532;
				float3 temp_output_4_0_g43132 = NORMAL_WORLD_OUT164_g38532;
				float3 temp_output_178_0_g43132 = ddx( temp_output_4_0_g43132 );
				float dotResult195_g43132 = dot( temp_output_178_0_g43132 , temp_output_178_0_g43132 );
				float3 temp_output_175_0_g43132 = ddy( temp_output_4_0_g43132 );
				float dotResult201_g43132 = dot( temp_output_175_0_g43132 , temp_output_175_0_g43132 );
				float4 break377_g38532 = OUT_ALBEDO_RGBA1177_g38532;
				float ALBEDO_R169_g38532 = break377_g38532.r;
				float4 temp_cast_17 = (ALBEDO_R169_g38532).xxxx;
				float4 m_Geometric215_g43132 = ( sqrt( saturate( ( temp_output_216_0_g43132 + ( ( dotResult195_g43132 + dotResult201_g43132 ) * 2.0 ) ) ) ) * ( 1.0 - temp_cast_17 ) );
				float4 localSmoothnessTypefloat4switch215_g43132 = SmoothnessTypefloat4switch215_g43132( m_switch215_g43132 , m_Smoothness215_g43132 , m_Roughness215_g43132 , m_Geometric215_g43132 );
				float4 temp_output_1556_33_g38532 = localSmoothnessTypefloat4switch215_g43132;
				float4 PBR_Occlusion1641_g38532 = SAMPLE_TEXTURE2D( _OcclusionMap, sampler_trilinear_repeat, UV40_g43133 );
				float temp_output_16_0_g43125 = _OcclusionStrengthAO;
				float temp_output_65_0_g43125 = ( 1.0 - temp_output_16_0_g43125 );
				float3 appendResult69_g43125 = (float3(temp_output_65_0_g43125 , temp_output_65_0_g43125 , temp_output_65_0_g43125));
				float4 color77_g43125 = IsGammaSpace() ? float4(1,1,1,1) : float4(1,1,1,1);
				float4 temp_cast_20 = (packedInput.ase_color.a).xxxx;
				float4 lerpResult75_g43125 = lerp( color77_g43125 , temp_cast_20 , temp_output_16_0_g43125);
				float4 lerpResult83_g43125 = lerp( float4( ( ( ( (PBR_Occlusion1641_g38532).xyz - float3( 0.5,0.5,0.5 ) ) * temp_output_16_0_g43125 ) + appendResult69_g43125 ) , 0.0 ) , lerpResult75_g43125 , _OcclusionSource);
				float4 Occlusion1550_g38532 = saturate( lerpResult83_g43125 );
				
				float lerpResult3_g43155 = lerp( 0.0 , _SpecularAAScreenSpaceVariance , _EnableGeometricSpecularAA);
				
				float lerpResult4_g43155 = lerp( 0.0 , _SpecularAAThreshold , _EnableGeometricSpecularAA);
				
				surfaceDescription.Albedo = lerpResult409_g43147.xyz;
				surfaceDescription.Normal = lerpResult410_g43147;
				surfaceDescription.BentNormal = local_BentNormal_Spacefloat3switch6_g43151;
				surfaceDescription.CoatMask = 0;
				surfaceDescription.Metallic = ( _MASK_B1440_g38532.r * temp_output_1_0_g43124 );

				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceDescription.Specular = 0;
				#endif

				surfaceDescription.Emission = 0;
				surfaceDescription.Smoothness = ( temp_output_1556_33_g38532 * Occlusion1550_g38532 ).x;
				surfaceDescription.Occlusion = saturate( lerpResult83_g43125 ).r;
				surfaceDescription.Alpha = break377_g38532.a;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = _AlphaCutoff;
				#endif

				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
				surfaceDescription.SpecularAAScreenSpaceVariance = lerpResult3_g43155;
				surfaceDescription.SpecularAAThreshold = lerpResult4_g43155;
				#endif

				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceDescription.SpecularOcclusion = 0;
				#endif

				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceDescription.Thickness = 1;
				#endif

				#ifdef _HAS_REFRACTION
				surfaceDescription.RefractionIndex = 1;
				surfaceDescription.RefractionColor = float3( 1, 1, 1 );
				surfaceDescription.RefractionDistance = 0;
				#endif

				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceDescription.SubsurfaceMask = 1;
				#endif

				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
				surfaceDescription.DiffusionProfile = 0;
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceDescription.Anisotropy = 1;
				surfaceDescription.Tangent = float3( 1, 0, 0 );
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceDescription.IridescenceMask = 0;
				surfaceDescription.IridescenceThickness = 0;
				#endif

				GetSurfaceAndBuiltinData(surfaceDescription,input, V, posInput, surfaceData, builtinData);

				BSDFData bsdfData = ConvertSurfaceDataToBSDFData(input.positionSS.xy, surfaceData);
				LightTransportData lightTransportData = GetLightTransportData(surfaceData, builtinData, bsdfData);

				float4 res = float4(0.0, 0.0, 0.0, 1.0);
				if (unity_MetaFragmentControl.x)
				{
					res.rgb = clamp(pow(abs(lightTransportData.diffuseColor), saturate(unity_OneOverOutputBoost)), 0, unity_MaxOutputValue);
				}

				if (unity_MetaFragmentControl.y)
				{
					res.rgb = lightTransportData.emissiveColor;
				}

				return res;
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "ShadowCaster"
			Tags { "LightMode"="ShadowCaster" }

			Cull [_CullMode]
			ZWrite On
			ZClip [_ZClip]
			ZTest LEqual
			ColorMask 0

			HLSLPROGRAM

			#define _ALPHATEST_SHADOW_ON 1
			#define _SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL 1
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_BENT_NORMAL 1
			#define _AMBIENT_OCCLUSION 1
			#define HAVE_MESH_MODIFICATION
			#define ASE_SRP_VERSION 100400
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local _DOUBLESIDED_ON
			#pragma shader_feature_local _ _BLENDMODE_ALPHA _BLENDMODE_ADD _BLENDMODE_PRE_MULTIPLY
			#pragma shader_feature_local _ENABLE_FOG_ON_TRANSPARENT
			#pragma shader_feature_local _ALPHATEST_ON

			#define SHADERPASS SHADERPASS_SHADOWS

			#pragma vertex Vert
			#pragma fragment Frag

			//#define UNITY_MATERIAL_LIT

			#if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
			#endif

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl"

			//#define USE_LEGACY_UNITY_MATRIX_VARIABLES

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#ifdef DEBUG_DISPLAY
				#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
			#endif

			CBUFFER_START( UnityPerMaterial )
			float4 _Smoothness;
			half4 _ColorDetail;
			float4 _Color;
			float _SmoothnessMax;
			half _DetailOffsetXDetailMask;
			half _DetailOffsetYDetailMask;
			half _Detail_BlendAmountMask;
			half _Detail_BlendHardnessMask;
			half _Detail_BlendFalloffMask;
			half _DetailBlendInfluence;
			int _BlendColor;
			half _BlendHeight;
			half _DetailBlendSmooth;
			float _EnableDetailMap;
			half _NormalStrength;
			half _DetailNormalMapScale;
			int _NormalMapSpace;
			half _NormalStrengthBent;
			float _MetallicStrength;
			int _SmoothnessSource;
			float _OcclusionStrengthAO;
			float _OcclusionSource;
			float _AlphaCutoffShadow;
			float _SpecularAAScreenSpaceVariance;
			float _DetailTilingYDetailMask;
			float _DetailTilingXDetailMask;
			half _DetailOffsetXDetail;
			float _EnableGeometricSpecularAA;
			float _SmoothnessMin;
			float _DoubleSidedGIMode;
			half _EmissionFlags;
			float _TransparentWritingMotionVec;
			float _EnableBlendModePreserveSpecularLighting;
			float _AlphaToMaskInspectorValue;
			int _OpaqueCullMode;
			int _WindMode;
			float _GlobalWindInfluenceOther;
			float _LocalWindStrength;
			float _LocalRandomWindOffset;
			float _LocalWindPulse;
			float _LocalWindDirection;
			float _TilingX;
			float _TilingY;
			float _OffsetX;
			float _OffsetY;
			half _Brightness;
			int _EnableDetailMask;
			float _DetailTilingXDetail;
			float _DetailTilingYDetail;
			half _DetailOffsetYDetail;
			float _SpecularAAThreshold;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			int _Global_Wind_Main_Fade_Enabled;
			float _Global_Wind_Main_Intensity;
			float _Global_Wind_Main_RandomOffset;
			float _Global_Wind_Main_Pulse;
			float _Global_Wind_Main_Direction;
			float _Global_Wind_Main_Fade_Bias;
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_trilinear_repeat);


			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			#define ASE_NEEDS_VERT_POSITION
			#pragma instancing_options procedural:SetupNatureRenderer forwardadd
			#pragma multi_compile GPU_FRUSTUM_ON __
			#include "Nature Renderer.cginc"
			#pragma multi_compile_local _ NATURE_RENDERER
			#pragma shader_feature_local _ALPHATOMASK_ON
			#pragma shader_feature_local _ _VERTEX_DISPLACEMENT _PIXEL_DISPLACEMENT
			#pragma shader_feature_local_vertex _VERTEX_DISPLACEMENT_LOCK_OBJECT_SCALE
			#pragma shader_feature_local _DISPLACEMENT_LOCK_TILING_SCALE
			#pragma shader_feature_local_fragment _PIXEL_DISPLACEMENT_LOCK_OBJECT_SCALE


			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
				#define ASE_NEED_CULLFACE 1
			#endif

			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				float4 positionCS : SV_Position;
				float3 interp00 : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};

			float Wind_Globalfloatswitch( int m_switch, float m_Off, float m_Global, float m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float(0);
			}
			
			float2 DirectionalEquation( float _WindDirection )
			{
				float d = _WindDirection * 0.0174532924;
				float xL = cos(d) + 1 / 2;
				float zL = sin(d) + 1 / 2;
				return float2(zL,xL);
			}
			
			float3 Wind_Globalfloat3switch( int m_switch, float3 m_Off, float3 m_Global, float3 m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float3(0,0,0);
			}
			
			float3 Wind_Fadefloat3switch3050_g3455( int m_switch, float3 m_Off, float3 m_ActiveFadeOut, float3 m_ActiveFadeIn )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_ActiveFadeOut;
				else if(m_switch ==2)
					return m_ActiveFadeIn;
				else
				return float3(0,0,0);
			}
			

			void BuildSurfaceData(FragInputs fragInputs, inout AlphaSurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.specularOcclusion = 1.0;

				// surface data

				// refraction
				#ifdef _HAS_REFRACTION
				if( _EnableSSRefraction )
				{
					surfaceData.transmittanceMask = ( 1.0 - surfaceDescription.Alpha );
					surfaceDescription.Alpha = 1.0;
				}
				else
				{
					surfaceData.ior = 1.0;
					surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
					surfaceData.atDistance = 1.0;
					surfaceData.transmittanceMask = 0.0;
					surfaceDescription.Alpha = 1.0;
				}
				#else
				surfaceData.ior = 1.0;
				surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
				surfaceData.atDistance = 1.0;
				surfaceData.transmittanceMask = 0.0;
				#endif


				// material features
				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
				#endif
				#ifdef ASE_LIT_CLEAR_COAT
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				// others
				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
				surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif
				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				// normals
				float3 normalTS = float3(0.0f, 0.0f, 1.0f);
				GetNormalWS( fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants );

				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
				surfaceData.tangentWS = normalize( fragInputs.tangentToWorld[ 0 ].xyz );
				
				// decals
				#if HAVE_DECALS
				if( _EnableDecals )
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs.tangentToWorld[2], surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
				#endif

				bentNormalWS = surfaceData.normalWS;
				surfaceData.tangentWS = Orthonormalize( surfaceData.tangentWS, surfaceData.normalWS );

				#if defined(_SPECULAR_OCCLUSION_CUSTOM)
				#elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO( V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness( surfaceData.perceptualSmoothness ) );
				#elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion( ClampNdotV( dot( surfaceData.normalWS, V ) ), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness( surfaceData.perceptualSmoothness ) );
				#endif

				// debug
				#if defined(DEBUG_DISPLAY)
				if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				{
					surfaceData.metallic = 0;
				}
				ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
				#endif
			}

			void GetSurfaceAndBuiltinData(AlphaSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
				LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				ApplyDoubleSidedFlipOrMirror( fragInputs, doubleSidedConstants );

				#ifdef _ALPHATEST_ON
				#ifdef _ALPHATEST_SHADOW_ON
				DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThresholdShadow );
				#else
				DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif
				#endif

				#ifdef _DEPTHOFFSET_ON
				builtinData.depthOffset = surfaceDescription.DepthOffset;
				ApplyDepthOffsetPositionInput( V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput );
				#endif

				float3 bentNormalWS;
				BuildSurfaceData( fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS );

				InitBuiltinData( posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[ 2 ], fragInputs.texCoord1, fragInputs.texCoord2, builtinData );

				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh )
			{
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS;
				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, outputPackedVaryingsMeshToPS);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( outputPackedVaryingsMeshToPS );

				int m_switch3050_g3455 = _Global_Wind_Main_Fade_Enabled;
				int m_switch2453_g3455 = _WindMode;
				float3 m_Off2453_g3455 = float3(0,0,0);
				float3 VERTEX_POSITION_MATRIX2352_g3455 = mul( GetObjectToWorldMatrix(), float4( inputMesh.positionOS , 0.0 ) ).xyz;
				float3 break2265_g3455 = VERTEX_POSITION_MATRIX2352_g3455;
				int WIND_MODE2462_g3455 = _WindMode;
				int m_switch2458_g3455 = WIND_MODE2462_g3455;
				float m_Off2458_g3455 = 1.0;
				float m_Global2458_g3455 = ( _GlobalWindInfluenceOther * _Global_Wind_Main_Intensity );
				float m_Local2458_g3455 = _LocalWindStrength;
				float localWind_Globalfloatswitch2458_g3455 = Wind_Globalfloatswitch( m_switch2458_g3455 , m_Off2458_g3455 , m_Global2458_g3455 , m_Local2458_g3455 );
				float _WIND_STRENGHT2400_g3455 = localWind_Globalfloatswitch2458_g3455;
				int m_switch2468_g3455 = WIND_MODE2462_g3455;
				float m_Off2468_g3455 = 1.0;
				float m_Global2468_g3455 = _Global_Wind_Main_RandomOffset;
				float m_Local2468_g3455 = _LocalRandomWindOffset;
				float localWind_Globalfloatswitch2468_g3455 = Wind_Globalfloatswitch( m_switch2468_g3455 , m_Off2468_g3455 , m_Global2468_g3455 , m_Local2468_g3455 );
				float4 transform3073_g3455 = mul(GetObjectToWorldMatrix(),float4( 0,0,0,1 ));
				transform3073_g3455.xyz = GetAbsolutePositionWS((transform3073_g3455).xyz);
				float2 appendResult2307_g3455 = (float2(transform3073_g3455.x , transform3073_g3455.z));
				float dotResult2341_g3455 = dot( appendResult2307_g3455 , float2( 12.9898,78.233 ) );
				float lerpResult2238_g3455 = lerp( 0.8 , ( ( localWind_Globalfloatswitch2468_g3455 / 2.0 ) + 0.9 ) , frac( ( sin( dotResult2341_g3455 ) * 43758.55 ) ));
				float _WIND_RANDOM_OFFSET2244_g3455 = ( ( _TimeParameters.x * 0.05 ) * lerpResult2238_g3455 );
				float _WIND_TUBULENCE_RANDOM2274_g3455 = ( sin( ( ( _WIND_RANDOM_OFFSET2244_g3455 * 40.0 ) - ( VERTEX_POSITION_MATRIX2352_g3455.z / 15.0 ) ) ) * 0.5 );
				int m_switch2312_g3455 = WIND_MODE2462_g3455;
				float m_Off2312_g3455 = 1.0;
				float m_Global2312_g3455 = _Global_Wind_Main_Pulse;
				float m_Local2312_g3455 = _LocalWindPulse;
				float localWind_Globalfloatswitch2312_g3455 = Wind_Globalfloatswitch( m_switch2312_g3455 , m_Off2312_g3455 , m_Global2312_g3455 , m_Local2312_g3455 );
				float _WIND_PULSE2421_g3455 = localWind_Globalfloatswitch2312_g3455;
				float FUNC_Angle2470_g3455 = ( _WIND_STRENGHT2400_g3455 * ( 1.0 + sin( ( ( ( ( _WIND_RANDOM_OFFSET2244_g3455 * 2.0 ) + _WIND_TUBULENCE_RANDOM2274_g3455 ) - ( VERTEX_POSITION_MATRIX2352_g3455.z / 50.0 ) ) - ( inputMesh.ase_color.r / 20.0 ) ) ) ) * sqrt( inputMesh.ase_color.r ) * _WIND_PULSE2421_g3455 );
				float FUNC_Angle_SinA2424_g3455 = sin( FUNC_Angle2470_g3455 );
				float FUNC_Angle_CosA2362_g3455 = cos( FUNC_Angle2470_g3455 );
				int m_switch2456_g3455 = WIND_MODE2462_g3455;
				float m_Off2456_g3455 = 1.0;
				float m_Global2456_g3455 = _Global_Wind_Main_Direction;
				float m_Local2456_g3455 = _LocalWindDirection;
				float localWind_Globalfloatswitch2456_g3455 = Wind_Globalfloatswitch( m_switch2456_g3455 , m_Off2456_g3455 , m_Global2456_g3455 , m_Local2456_g3455 );
				float _WindDirection2249_g3455 = localWind_Globalfloatswitch2456_g3455;
				float2 localDirectionalEquation2249_g3455 = DirectionalEquation( _WindDirection2249_g3455 );
				float2 break2469_g3455 = localDirectionalEquation2249_g3455;
				float _WIND_DIRECTION_X2418_g3455 = break2469_g3455.x;
				float lerpResult2258_g3455 = lerp( break2265_g3455.x , ( ( break2265_g3455.y * FUNC_Angle_SinA2424_g3455 ) + ( break2265_g3455.x * FUNC_Angle_CosA2362_g3455 ) ) , _WIND_DIRECTION_X2418_g3455);
				float3 break2340_g3455 = VERTEX_POSITION_MATRIX2352_g3455;
				float3 break2233_g3455 = VERTEX_POSITION_MATRIX2352_g3455;
				float _WIND_DIRECTION_Y2416_g3455 = break2469_g3455.y;
				float lerpResult2275_g3455 = lerp( break2233_g3455.z , ( ( break2233_g3455.y * FUNC_Angle_SinA2424_g3455 ) + ( break2233_g3455.z * FUNC_Angle_CosA2362_g3455 ) ) , _WIND_DIRECTION_Y2416_g3455);
				float3 appendResult2235_g3455 = (float3(lerpResult2258_g3455 , ( ( break2340_g3455.y * FUNC_Angle_CosA2362_g3455 ) - ( break2340_g3455.z * FUNC_Angle_SinA2424_g3455 ) ) , lerpResult2275_g3455));
				float3 VERTEX_POSITION2282_g3455 = ( mul( GetWorldToObjectMatrix(), float4( appendResult2235_g3455 , 0.0 ) ).xyz - inputMesh.positionOS );
				float3 m_Global2453_g3455 = VERTEX_POSITION2282_g3455;
				float3 m_Local2453_g3455 = VERTEX_POSITION2282_g3455;
				float3 localWind_Globalfloat3switch2453_g3455 = Wind_Globalfloat3switch( m_switch2453_g3455 , m_Off2453_g3455 , m_Global2453_g3455 , m_Local2453_g3455 );
				float3 m_Off3050_g3455 = localWind_Globalfloat3switch2453_g3455;
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				float temp_output_3048_0_g3455 = saturate( pow( ( distance( _WorldSpaceCameraPos , ase_worldPos ) / _Global_Wind_Main_Fade_Bias ) , 5.0 ) );
				float3 m_ActiveFadeOut3050_g3455 = ( localWind_Globalfloat3switch2453_g3455 * ( 1.0 - temp_output_3048_0_g3455 ) );
				float3 m_ActiveFadeIn3050_g3455 = ( localWind_Globalfloat3switch2453_g3455 * temp_output_3048_0_g3455 );
				float3 localWind_Fadefloat3switch3050_g3455 = Wind_Fadefloat3switch3050_g3455( m_switch3050_g3455 , m_Off3050_g3455 , m_ActiveFadeOut3050_g3455 , m_ActiveFadeIn3050_g3455 );
				float3 temp_output_309_0_g38532 = localWind_Fadefloat3switch3050_g3455;
				
				outputPackedVaryingsMeshToPS.ase_texcoord1.xy = inputMesh.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord1.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = temp_output_309_0_g38532;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS =  inputMesh.normalOS ;

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				outputPackedVaryingsMeshToPS.positionCS = TransformWorldToHClip(positionRWS);
				outputPackedVaryingsMeshToPS.interp00.xyz = positionRWS;
				return outputPackedVaryingsMeshToPS;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.ase_color = v.ase_color;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif
			
			#if defined(WRITE_NORMAL_BUFFER) && defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_DECAL SV_Target2
			#elif defined(WRITE_NORMAL_BUFFER) || defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_DECAL SV_Target1
			#else
			#define SV_TARGET_DECAL SV_Target0
			#endif

			void Frag( PackedVaryingsMeshToPS packedInput
						#if defined(SCENESELECTIONPASS) || defined(SCENEPICKINGPASS)
						, out float4 outColor : SV_Target0
						#else
							#ifdef WRITE_MSAA_DEPTH
							// We need the depth color as SV_Target0 for alpha to coverage
							, out float4 depthColor : SV_Target0
								#ifdef WRITE_NORMAL_BUFFER
								, out float4 outNormalBuffer : SV_Target1
								#endif
							#else
								#ifdef WRITE_NORMAL_BUFFER
								, out float4 outNormalBuffer : SV_Target0
								#endif
							#endif

							// Decal buffer must be last as it is bind but we can optionally write into it (based on _DISABLE_DECALS)
							#if defined(WRITE_DECAL_BUFFER) && !defined(_DISABLE_DECALS)
							, out float4 outDecalBuffer : SV_TARGET_DECAL
							#endif
						#endif

						#if defined(_DEPTHOFFSET_ON) && !defined(SCENEPICKINGPASS)
						, out float outputDepth : SV_Depth
						#endif
						
					)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				UNITY_SETUP_INSTANCE_ID( packedInput );

				float3 positionRWS = packedInput.interp00.xyz;

				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);

				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.positionCS;

				input.positionRWS = positionRWS;

				#if _DOUBLESIDED_ON && SHADER_STAGE_FRAGMENT
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false);
				#elif SHADER_STAGE_FRAGMENT
				#if defined(ASE_NEED_CULLFACE)
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false );
				#endif
				#endif
				half isFrontFace = input.isFrontFace;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

				float3 V = GetWorldSpaceNormalizeViewDir(input.positionRWS);

				AlphaSurfaceDescription surfaceDescription = (AlphaSurfaceDescription)0;
				float2 appendResult150_g38532 = (float2(_TilingX , _TilingY));
				float2 appendResult151_g38532 = (float2(_OffsetX , _OffsetY));
				float2 texCoord2_g43136 = packedInput.ase_texcoord1.xy * appendResult150_g38532 + appendResult151_g38532;
				float2 OUT_UV431_g38532 = texCoord2_g43136;
				float2 UV40_g43133 = OUT_UV431_g38532;
				float4 tex2DNode63_g43133 = SAMPLE_TEXTURE2D( _MainTex, sampler_trilinear_repeat, UV40_g43133 );
				float4 OUT_ALBEDO_RGBA1177_g38532 = tex2DNode63_g43133;
				float4 break377_g38532 = OUT_ALBEDO_RGBA1177_g38532;
				
				surfaceDescription.Alpha = break377_g38532.a;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = _AlphaCutoff;
				#endif

				#ifdef _ALPHATEST_SHADOW_ON
				surfaceDescription.AlphaClipThresholdShadow = _AlphaCutoffShadow;
				#endif

				#ifdef _DEPTHOFFSET_ON
				surfaceDescription.DepthOffset = 0;
				#endif

				SurfaceData surfaceData;
				BuiltinData builtinData;
				GetSurfaceAndBuiltinData(surfaceDescription, input, V, posInput, surfaceData, builtinData);

				#ifdef _DEPTHOFFSET_ON
				outputDepth = posInput.deviceDepth;
				#endif

				#ifdef WRITE_NORMAL_BUFFER
				EncodeIntoNormalBuffer( ConvertSurfaceDataToNormalData( surfaceData ), posInput.positionSS, outNormalBuffer );
				#ifdef WRITE_MSAA_DEPTH
				depthColor = packedInput.positionCS.z;
				#endif
				#elif defined(WRITE_MSAA_DEPTH)
				//outNormalBuffer = float4( 0.0, 0.0, 0.0, 1.0 );
				depthColor = packedInput.positionCS.z;
				#elif defined(SCENESELECTIONPASS)
				outColor = float4( _ObjectId, _PassValue, 1.0, 1.0 );
				#endif
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "SceneSelectionPass"
			Tags { "LightMode"="SceneSelectionPass" }
			ColorMask 0

			HLSLPROGRAM

			#define _ALPHATEST_SHADOW_ON 1
			#define _SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL 1
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_BENT_NORMAL 1
			#define _AMBIENT_OCCLUSION 1
			#define HAVE_MESH_MODIFICATION
			#define ASE_SRP_VERSION 100400
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local _DOUBLESIDED_ON
			#pragma shader_feature_local _ _BLENDMODE_ALPHA _BLENDMODE_ADD _BLENDMODE_PRE_MULTIPLY
			#pragma shader_feature_local _ENABLE_FOG_ON_TRANSPARENT
			#pragma shader_feature_local _ALPHATEST_ON

			#define SHADERPASS SHADERPASS_DEPTH_ONLY
			#define SCENESELECTIONPASS
			#pragma editor_sync_compilation

			#pragma vertex Vert
			#pragma fragment Frag

			//#define UNITY_MATERIAL_LIT

			#if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
			#endif

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#ifdef DEBUG_DISPLAY
				#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
			#endif

			CBUFFER_START( UnityPerMaterial )
			float4 _Smoothness;
			half4 _ColorDetail;
			float4 _Color;
			float _SmoothnessMax;
			half _DetailOffsetXDetailMask;
			half _DetailOffsetYDetailMask;
			half _Detail_BlendAmountMask;
			half _Detail_BlendHardnessMask;
			half _Detail_BlendFalloffMask;
			half _DetailBlendInfluence;
			int _BlendColor;
			half _BlendHeight;
			half _DetailBlendSmooth;
			float _EnableDetailMap;
			half _NormalStrength;
			half _DetailNormalMapScale;
			int _NormalMapSpace;
			half _NormalStrengthBent;
			float _MetallicStrength;
			int _SmoothnessSource;
			float _OcclusionStrengthAO;
			float _OcclusionSource;
			float _AlphaCutoffShadow;
			float _SpecularAAScreenSpaceVariance;
			float _DetailTilingYDetailMask;
			float _DetailTilingXDetailMask;
			half _DetailOffsetXDetail;
			float _EnableGeometricSpecularAA;
			float _SmoothnessMin;
			float _DoubleSidedGIMode;
			half _EmissionFlags;
			float _TransparentWritingMotionVec;
			float _EnableBlendModePreserveSpecularLighting;
			float _AlphaToMaskInspectorValue;
			int _OpaqueCullMode;
			int _WindMode;
			float _GlobalWindInfluenceOther;
			float _LocalWindStrength;
			float _LocalRandomWindOffset;
			float _LocalWindPulse;
			float _LocalWindDirection;
			float _TilingX;
			float _TilingY;
			float _OffsetX;
			float _OffsetY;
			half _Brightness;
			int _EnableDetailMask;
			float _DetailTilingXDetail;
			float _DetailTilingYDetail;
			half _DetailOffsetYDetail;
			float _SpecularAAThreshold;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			int _Global_Wind_Main_Fade_Enabled;
			float _Global_Wind_Main_Intensity;
			float _Global_Wind_Main_RandomOffset;
			float _Global_Wind_Main_Pulse;
			float _Global_Wind_Main_Direction;
			float _Global_Wind_Main_Fade_Bias;
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_trilinear_repeat);


			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			#define ASE_NEEDS_VERT_POSITION
			#pragma instancing_options procedural:SetupNatureRenderer forwardadd
			#pragma multi_compile GPU_FRUSTUM_ON __
			#include "Nature Renderer.cginc"
			#pragma multi_compile_local _ NATURE_RENDERER
			#pragma shader_feature_local _ALPHATOMASK_ON
			#pragma shader_feature_local _ _VERTEX_DISPLACEMENT _PIXEL_DISPLACEMENT
			#pragma shader_feature_local_vertex _VERTEX_DISPLACEMENT_LOCK_OBJECT_SCALE
			#pragma shader_feature_local _DISPLACEMENT_LOCK_TILING_SCALE
			#pragma shader_feature_local_fragment _PIXEL_DISPLACEMENT_LOCK_OBJECT_SCALE


			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
				#define ASE_NEED_CULLFACE 1
			#endif

			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				float4 positionCS : SV_Position;
				float3 interp00 : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};

			int _ObjectId;
			int _PassValue;

			float Wind_Globalfloatswitch( int m_switch, float m_Off, float m_Global, float m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float(0);
			}
			
			float2 DirectionalEquation( float _WindDirection )
			{
				float d = _WindDirection * 0.0174532924;
				float xL = cos(d) + 1 / 2;
				float zL = sin(d) + 1 / 2;
				return float2(zL,xL);
			}
			
			float3 Wind_Globalfloat3switch( int m_switch, float3 m_Off, float3 m_Global, float3 m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float3(0,0,0);
			}
			
			float3 Wind_Fadefloat3switch3050_g3455( int m_switch, float3 m_Off, float3 m_ActiveFadeOut, float3 m_ActiveFadeIn )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_ActiveFadeOut;
				else if(m_switch ==2)
					return m_ActiveFadeIn;
				else
				return float3(0,0,0);
			}
			

			void BuildSurfaceData(FragInputs fragInputs, inout SceneSurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.specularOcclusion = 1.0;

				// surface data

				// refraction
				#ifdef _HAS_REFRACTION
				if( _EnableSSRefraction )
				{
					surfaceData.transmittanceMask = ( 1.0 - surfaceDescription.Alpha );
					surfaceDescription.Alpha = 1.0;
				}
				else
				{
					surfaceData.ior = 1.0;
					surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
					surfaceData.atDistance = 1.0;
					surfaceData.transmittanceMask = 0.0;
					surfaceDescription.Alpha = 1.0;
				}
				#else
				surfaceData.ior = 1.0;
				surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
				surfaceData.atDistance = 1.0;
				surfaceData.transmittanceMask = 0.0;
				#endif


				// material features
				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
				#endif
				#ifdef ASE_LIT_CLEAR_COAT
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				// others
				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
				surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif
				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				// normals
				float3 normalTS = float3(0.0f, 0.0f, 1.0f);
				GetNormalWS( fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants );

				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
				surfaceData.tangentWS = normalize( fragInputs.tangentToWorld[ 0 ].xyz );

				// decals
				#if HAVE_DECALS
				if( _EnableDecals )
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs.tangentToWorld[2], surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
				#endif

				bentNormalWS = surfaceData.normalWS;
				surfaceData.tangentWS = Orthonormalize( surfaceData.tangentWS, surfaceData.normalWS );

				#if defined(_SPECULAR_OCCLUSION_CUSTOM)
				#elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO( V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness( surfaceData.perceptualSmoothness ) );
				#elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion( ClampNdotV( dot( surfaceData.normalWS, V ) ), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness( surfaceData.perceptualSmoothness ) );
				#endif

				// debug
				#if defined(DEBUG_DISPLAY)
				if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				{
					surfaceData.metallic = 0;
				}
				ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
				#endif
			}

			void GetSurfaceAndBuiltinData(SceneSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
				LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				ApplyDoubleSidedFlipOrMirror( fragInputs, doubleSidedConstants );

				#ifdef _ALPHATEST_ON
				DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#ifdef _DEPTHOFFSET_ON
				builtinData.depthOffset = surfaceDescription.DepthOffset;
				ApplyDepthOffsetPositionInput( V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput );
				#endif

				float3 bentNormalWS;
				BuildSurfaceData( fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS );

				InitBuiltinData( posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[ 2 ], fragInputs.texCoord1, fragInputs.texCoord2, builtinData );

				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh )
			{
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS;
				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, outputPackedVaryingsMeshToPS);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( outputPackedVaryingsMeshToPS );

				int m_switch3050_g3455 = _Global_Wind_Main_Fade_Enabled;
				int m_switch2453_g3455 = _WindMode;
				float3 m_Off2453_g3455 = float3(0,0,0);
				float3 VERTEX_POSITION_MATRIX2352_g3455 = mul( GetObjectToWorldMatrix(), float4( inputMesh.positionOS , 0.0 ) ).xyz;
				float3 break2265_g3455 = VERTEX_POSITION_MATRIX2352_g3455;
				int WIND_MODE2462_g3455 = _WindMode;
				int m_switch2458_g3455 = WIND_MODE2462_g3455;
				float m_Off2458_g3455 = 1.0;
				float m_Global2458_g3455 = ( _GlobalWindInfluenceOther * _Global_Wind_Main_Intensity );
				float m_Local2458_g3455 = _LocalWindStrength;
				float localWind_Globalfloatswitch2458_g3455 = Wind_Globalfloatswitch( m_switch2458_g3455 , m_Off2458_g3455 , m_Global2458_g3455 , m_Local2458_g3455 );
				float _WIND_STRENGHT2400_g3455 = localWind_Globalfloatswitch2458_g3455;
				int m_switch2468_g3455 = WIND_MODE2462_g3455;
				float m_Off2468_g3455 = 1.0;
				float m_Global2468_g3455 = _Global_Wind_Main_RandomOffset;
				float m_Local2468_g3455 = _LocalRandomWindOffset;
				float localWind_Globalfloatswitch2468_g3455 = Wind_Globalfloatswitch( m_switch2468_g3455 , m_Off2468_g3455 , m_Global2468_g3455 , m_Local2468_g3455 );
				float4 transform3073_g3455 = mul(GetObjectToWorldMatrix(),float4( 0,0,0,1 ));
				transform3073_g3455.xyz = GetAbsolutePositionWS((transform3073_g3455).xyz);
				float2 appendResult2307_g3455 = (float2(transform3073_g3455.x , transform3073_g3455.z));
				float dotResult2341_g3455 = dot( appendResult2307_g3455 , float2( 12.9898,78.233 ) );
				float lerpResult2238_g3455 = lerp( 0.8 , ( ( localWind_Globalfloatswitch2468_g3455 / 2.0 ) + 0.9 ) , frac( ( sin( dotResult2341_g3455 ) * 43758.55 ) ));
				float _WIND_RANDOM_OFFSET2244_g3455 = ( ( _TimeParameters.x * 0.05 ) * lerpResult2238_g3455 );
				float _WIND_TUBULENCE_RANDOM2274_g3455 = ( sin( ( ( _WIND_RANDOM_OFFSET2244_g3455 * 40.0 ) - ( VERTEX_POSITION_MATRIX2352_g3455.z / 15.0 ) ) ) * 0.5 );
				int m_switch2312_g3455 = WIND_MODE2462_g3455;
				float m_Off2312_g3455 = 1.0;
				float m_Global2312_g3455 = _Global_Wind_Main_Pulse;
				float m_Local2312_g3455 = _LocalWindPulse;
				float localWind_Globalfloatswitch2312_g3455 = Wind_Globalfloatswitch( m_switch2312_g3455 , m_Off2312_g3455 , m_Global2312_g3455 , m_Local2312_g3455 );
				float _WIND_PULSE2421_g3455 = localWind_Globalfloatswitch2312_g3455;
				float FUNC_Angle2470_g3455 = ( _WIND_STRENGHT2400_g3455 * ( 1.0 + sin( ( ( ( ( _WIND_RANDOM_OFFSET2244_g3455 * 2.0 ) + _WIND_TUBULENCE_RANDOM2274_g3455 ) - ( VERTEX_POSITION_MATRIX2352_g3455.z / 50.0 ) ) - ( inputMesh.ase_color.r / 20.0 ) ) ) ) * sqrt( inputMesh.ase_color.r ) * _WIND_PULSE2421_g3455 );
				float FUNC_Angle_SinA2424_g3455 = sin( FUNC_Angle2470_g3455 );
				float FUNC_Angle_CosA2362_g3455 = cos( FUNC_Angle2470_g3455 );
				int m_switch2456_g3455 = WIND_MODE2462_g3455;
				float m_Off2456_g3455 = 1.0;
				float m_Global2456_g3455 = _Global_Wind_Main_Direction;
				float m_Local2456_g3455 = _LocalWindDirection;
				float localWind_Globalfloatswitch2456_g3455 = Wind_Globalfloatswitch( m_switch2456_g3455 , m_Off2456_g3455 , m_Global2456_g3455 , m_Local2456_g3455 );
				float _WindDirection2249_g3455 = localWind_Globalfloatswitch2456_g3455;
				float2 localDirectionalEquation2249_g3455 = DirectionalEquation( _WindDirection2249_g3455 );
				float2 break2469_g3455 = localDirectionalEquation2249_g3455;
				float _WIND_DIRECTION_X2418_g3455 = break2469_g3455.x;
				float lerpResult2258_g3455 = lerp( break2265_g3455.x , ( ( break2265_g3455.y * FUNC_Angle_SinA2424_g3455 ) + ( break2265_g3455.x * FUNC_Angle_CosA2362_g3455 ) ) , _WIND_DIRECTION_X2418_g3455);
				float3 break2340_g3455 = VERTEX_POSITION_MATRIX2352_g3455;
				float3 break2233_g3455 = VERTEX_POSITION_MATRIX2352_g3455;
				float _WIND_DIRECTION_Y2416_g3455 = break2469_g3455.y;
				float lerpResult2275_g3455 = lerp( break2233_g3455.z , ( ( break2233_g3455.y * FUNC_Angle_SinA2424_g3455 ) + ( break2233_g3455.z * FUNC_Angle_CosA2362_g3455 ) ) , _WIND_DIRECTION_Y2416_g3455);
				float3 appendResult2235_g3455 = (float3(lerpResult2258_g3455 , ( ( break2340_g3455.y * FUNC_Angle_CosA2362_g3455 ) - ( break2340_g3455.z * FUNC_Angle_SinA2424_g3455 ) ) , lerpResult2275_g3455));
				float3 VERTEX_POSITION2282_g3455 = ( mul( GetWorldToObjectMatrix(), float4( appendResult2235_g3455 , 0.0 ) ).xyz - inputMesh.positionOS );
				float3 m_Global2453_g3455 = VERTEX_POSITION2282_g3455;
				float3 m_Local2453_g3455 = VERTEX_POSITION2282_g3455;
				float3 localWind_Globalfloat3switch2453_g3455 = Wind_Globalfloat3switch( m_switch2453_g3455 , m_Off2453_g3455 , m_Global2453_g3455 , m_Local2453_g3455 );
				float3 m_Off3050_g3455 = localWind_Globalfloat3switch2453_g3455;
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				float temp_output_3048_0_g3455 = saturate( pow( ( distance( _WorldSpaceCameraPos , ase_worldPos ) / _Global_Wind_Main_Fade_Bias ) , 5.0 ) );
				float3 m_ActiveFadeOut3050_g3455 = ( localWind_Globalfloat3switch2453_g3455 * ( 1.0 - temp_output_3048_0_g3455 ) );
				float3 m_ActiveFadeIn3050_g3455 = ( localWind_Globalfloat3switch2453_g3455 * temp_output_3048_0_g3455 );
				float3 localWind_Fadefloat3switch3050_g3455 = Wind_Fadefloat3switch3050_g3455( m_switch3050_g3455 , m_Off3050_g3455 , m_ActiveFadeOut3050_g3455 , m_ActiveFadeIn3050_g3455 );
				float3 temp_output_309_0_g38532 = localWind_Fadefloat3switch3050_g3455;
				
				outputPackedVaryingsMeshToPS.ase_texcoord1.xy = inputMesh.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord1.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = temp_output_309_0_g38532;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS =  inputMesh.normalOS ;

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				outputPackedVaryingsMeshToPS.positionCS = TransformWorldToHClip(positionRWS);
				outputPackedVaryingsMeshToPS.interp00.xyz = positionRWS;
				return outputPackedVaryingsMeshToPS;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.ase_color = v.ase_color;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif
			
			#if defined(WRITE_NORMAL_BUFFER) && defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_DECAL SV_Target2
			#elif defined(WRITE_NORMAL_BUFFER) || defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_DECAL SV_Target1
			#else
			#define SV_TARGET_DECAL SV_Target0
			#endif

			void Frag( PackedVaryingsMeshToPS packedInput
						#if defined(SCENESELECTIONPASS) || defined(SCENEPICKINGPASS)
						, out float4 outColor : SV_Target0
						#else
							#ifdef WRITE_MSAA_DEPTH
							// We need the depth color as SV_Target0 for alpha to coverage
							, out float4 depthColor : SV_Target0
								#ifdef WRITE_NORMAL_BUFFER
								, out float4 outNormalBuffer : SV_Target1
								#endif
							#else
								#ifdef WRITE_NORMAL_BUFFER
								, out float4 outNormalBuffer : SV_Target0
								#endif
							#endif

							// Decal buffer must be last as it is bind but we can optionally write into it (based on _DISABLE_DECALS)
							#if defined(WRITE_DECAL_BUFFER) && !defined(_DISABLE_DECALS)
							, out float4 outDecalBuffer : SV_TARGET_DECAL
							#endif
						#endif

						#if defined(_DEPTHOFFSET_ON) && !defined(SCENEPICKINGPASS)
						, out float outputDepth : SV_Depth
						#endif
						
					)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				UNITY_SETUP_INSTANCE_ID( packedInput );

				float3 positionRWS = packedInput.interp00.xyz;

				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);

				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.positionCS;

				input.positionRWS = positionRWS;

				#if _DOUBLESIDED_ON && SHADER_STAGE_FRAGMENT
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false);
				#elif SHADER_STAGE_FRAGMENT
				#if defined(ASE_NEED_CULLFACE)
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false );
				#endif
				#endif
				half isFrontFace = input.isFrontFace;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

				float3 V = GetWorldSpaceNormalizeViewDir(input.positionRWS);

				SceneSurfaceDescription surfaceDescription = (SceneSurfaceDescription)0;
				float2 appendResult150_g38532 = (float2(_TilingX , _TilingY));
				float2 appendResult151_g38532 = (float2(_OffsetX , _OffsetY));
				float2 texCoord2_g43136 = packedInput.ase_texcoord1.xy * appendResult150_g38532 + appendResult151_g38532;
				float2 OUT_UV431_g38532 = texCoord2_g43136;
				float2 UV40_g43133 = OUT_UV431_g38532;
				float4 tex2DNode63_g43133 = SAMPLE_TEXTURE2D( _MainTex, sampler_trilinear_repeat, UV40_g43133 );
				float4 OUT_ALBEDO_RGBA1177_g38532 = tex2DNode63_g43133;
				float4 break377_g38532 = OUT_ALBEDO_RGBA1177_g38532;
				
				surfaceDescription.Alpha = break377_g38532.a;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = _AlphaCutoff;
				#endif

				#ifdef _DEPTHOFFSET_ON
				surfaceDescription.DepthOffset = 0;
				#endif

				SurfaceData surfaceData;
				BuiltinData builtinData;
				GetSurfaceAndBuiltinData(surfaceDescription, input, V, posInput, surfaceData, builtinData);

				#ifdef _DEPTHOFFSET_ON
				outputDepth = posInput.deviceDepth;
				#endif

				#ifdef WRITE_NORMAL_BUFFER
				EncodeIntoNormalBuffer( ConvertSurfaceDataToNormalData( surfaceData ), posInput.positionSS, outNormalBuffer );
				#ifdef WRITE_MSAA_DEPTH
				depthColor = packedInput.positionCS.z;
				#endif
				#elif defined(WRITE_MSAA_DEPTH)
				//outNormalBuffer = float4( 0.0, 0.0, 0.0, 1.0 );
				depthColor = packedInput.positionCS.z;
				#elif defined(SCENESELECTIONPASS)
				outColor = float4( _ObjectId, _PassValue, 1.0, 1.0 );
				#endif
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "DepthOnly"
			Tags { "LightMode"="DepthOnly" }

			Cull [_CullMode]

			ZWrite On

			Stencil
			{
				Ref [_StencilRefDepth]
				WriteMask [_StencilWriteMaskDepth]
				Comp Always
				Pass Replace
				Fail Keep
				ZFail Keep
			}


			HLSLPROGRAM

			#define _ALPHATEST_SHADOW_ON 1
			#define _SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL 1
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_BENT_NORMAL 1
			#define _AMBIENT_OCCLUSION 1
			#define HAVE_MESH_MODIFICATION
			#define ASE_SRP_VERSION 100400
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local _DOUBLESIDED_ON
			#pragma shader_feature_local _BLENDMODE_OFF _BLENDMODE_ALPHA _BLENDMODE_ADD _BLENDMODE_PRE_MULTIPLY
			#pragma shader_feature_local _ENABLE_FOG_ON_TRANSPARENT
			#pragma shader_feature_local _ALPHATEST_ON
			#pragma shader_feature_local _ _DISABLE_DECALS

			#define SHADERPASS SHADERPASS_DEPTH_ONLY
			#pragma multi_compile _ WRITE_NORMAL_BUFFER
			#pragma multi_compile _ WRITE_MSAA_DEPTH
			#pragma multi_compile _ WRITE_DECAL_BUFFER

			#pragma vertex Vert
			#pragma fragment Frag

			//#define UNITY_MATERIAL_LIT

			#if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
			#endif

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#ifdef DEBUG_DISPLAY
				#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
			#endif
			
			CBUFFER_START( UnityPerMaterial )
			float4 _Smoothness;
			half4 _ColorDetail;
			float4 _Color;
			float _SmoothnessMax;
			half _DetailOffsetXDetailMask;
			half _DetailOffsetYDetailMask;
			half _Detail_BlendAmountMask;
			half _Detail_BlendHardnessMask;
			half _Detail_BlendFalloffMask;
			half _DetailBlendInfluence;
			int _BlendColor;
			half _BlendHeight;
			half _DetailBlendSmooth;
			float _EnableDetailMap;
			half _NormalStrength;
			half _DetailNormalMapScale;
			int _NormalMapSpace;
			half _NormalStrengthBent;
			float _MetallicStrength;
			int _SmoothnessSource;
			float _OcclusionStrengthAO;
			float _OcclusionSource;
			float _AlphaCutoffShadow;
			float _SpecularAAScreenSpaceVariance;
			float _DetailTilingYDetailMask;
			float _DetailTilingXDetailMask;
			half _DetailOffsetXDetail;
			float _EnableGeometricSpecularAA;
			float _SmoothnessMin;
			float _DoubleSidedGIMode;
			half _EmissionFlags;
			float _TransparentWritingMotionVec;
			float _EnableBlendModePreserveSpecularLighting;
			float _AlphaToMaskInspectorValue;
			int _OpaqueCullMode;
			int _WindMode;
			float _GlobalWindInfluenceOther;
			float _LocalWindStrength;
			float _LocalRandomWindOffset;
			float _LocalWindPulse;
			float _LocalWindDirection;
			float _TilingX;
			float _TilingY;
			float _OffsetX;
			float _OffsetY;
			half _Brightness;
			int _EnableDetailMask;
			float _DetailTilingXDetail;
			float _DetailTilingYDetail;
			half _DetailOffsetYDetail;
			float _SpecularAAThreshold;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			int _Global_Wind_Main_Fade_Enabled;
			float _Global_Wind_Main_Intensity;
			float _Global_Wind_Main_RandomOffset;
			float _Global_Wind_Main_Pulse;
			float _Global_Wind_Main_Direction;
			float _Global_Wind_Main_Fade_Bias;
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_trilinear_repeat);
			TEXTURE2D(_MainTex);
			TEXTURE2D(_DetailNormalMap);
			TEXTURE2D(_DetailMaskMap);
			TEXTURE2D(_SmoothnessMap);
			TEXTURE2D(_OcclusionMap);


			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_FRAG_COLOR
			#pragma instancing_options procedural:SetupNatureRenderer forwardadd
			#pragma multi_compile GPU_FRUSTUM_ON __
			#include "Nature Renderer.cginc"
			#pragma multi_compile_local _ NATURE_RENDERER
			#pragma shader_feature_local _ALPHATOMASK_ON
			#pragma shader_feature_local _ _VERTEX_DISPLACEMENT _PIXEL_DISPLACEMENT
			#pragma shader_feature_local_vertex _VERTEX_DISPLACEMENT_LOCK_OBJECT_SCALE
			#pragma shader_feature_local _DISPLACEMENT_LOCK_TILING_SCALE
			#pragma shader_feature_local_fragment _PIXEL_DISPLACEMENT_LOCK_OBJECT_SCALE


			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
				#define ASE_NEED_CULLFACE 1
			#endif

			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				float4 positionCS : SV_Position;
				float3 interp00 : TEXCOORD0;
				float3 interp01 : TEXCOORD1;
				float4 interp02 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};

			float Wind_Globalfloatswitch( int m_switch, float m_Off, float m_Global, float m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float(0);
			}
			
			float2 DirectionalEquation( float _WindDirection )
			{
				float d = _WindDirection * 0.0174532924;
				float xL = cos(d) + 1 / 2;
				float zL = sin(d) + 1 / 2;
				return float2(zL,xL);
			}
			
			float3 Wind_Globalfloat3switch( int m_switch, float3 m_Off, float3 m_Global, float3 m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float3(0,0,0);
			}
			
			float3 Wind_Fadefloat3switch3050_g3455( int m_switch, float3 m_Off, float3 m_ActiveFadeOut, float3 m_ActiveFadeIn )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_ActiveFadeOut;
				else if(m_switch ==2)
					return m_ActiveFadeIn;
				else
				return float3(0,0,0);
			}
			
			float Detail_BlendVCfloatswitch319_g43147( int m_switch, float m_Red, float m_Green, float m_Blue )
			{
				if(m_switch ==0)
					return m_Red;
				else if(m_switch ==1)
					return m_Green;
				else if(m_switch ==2)
					return m_Blue;
				else
				return float(0);
			}
			
			float3 Detail_Maskfloat3switch221_g43147( int m_switch, float3 m_Off, float3 m_Active, float3 m_ActiveInverted )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else if(m_switch ==2)
					return m_ActiveInverted;
				else
				return float3(0,0,0);
			}
			
			float4 SmoothnessTypefloat4switch215_g43132( int m_switch, float4 m_Smoothness, float4 m_Roughness, float4 m_Geometric )
			{
				if(m_switch ==0)
					return m_Smoothness;
				else if(m_switch ==1)
					return m_Roughness;
				else if(m_switch ==2)
					return m_Geometric;
				else
				return float4(0,0,0,0);
			}
			

			void BuildSurfaceData(FragInputs fragInputs, inout SmoothSurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.specularOcclusion = 1.0;

				// surface data
				surfaceData.perceptualSmoothness =		surfaceDescription.Smoothness;

				// refraction
				#ifdef _HAS_REFRACTION
				if( _EnableSSRefraction )
				{
					surfaceData.transmittanceMask = ( 1.0 - surfaceDescription.Alpha );
					surfaceDescription.Alpha = 1.0;
				}
				else
				{
					surfaceData.ior = 1.0;
					surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
					surfaceData.atDistance = 1.0;
					surfaceData.transmittanceMask = 0.0;
					surfaceDescription.Alpha = 1.0;
				}
				#else
				surfaceData.ior = 1.0;
				surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
				surfaceData.atDistance = 1.0;
				surfaceData.transmittanceMask = 0.0;
				#endif


				// material features
				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
				#endif
				#ifdef ASE_LIT_CLEAR_COAT
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				// others
				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
				surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif
				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				// normals
				float3 normalTS = float3(0.0f, 0.0f, 1.0f);
				normalTS = surfaceDescription.Normal;
				GetNormalWS( fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants );

				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
				surfaceData.tangentWS = normalize( fragInputs.tangentToWorld[ 0 ].xyz );
				
				// decals
				#if HAVE_DECALS
				if( _EnableDecals )
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs.tangentToWorld[2], surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
				#endif

				bentNormalWS = surfaceData.normalWS;
				surfaceData.tangentWS = Orthonormalize( surfaceData.tangentWS, surfaceData.normalWS );

				#if defined(_SPECULAR_OCCLUSION_CUSTOM)
				#elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO( V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness( surfaceData.perceptualSmoothness ) );
				#elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion( ClampNdotV( dot( surfaceData.normalWS, V ) ), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness( surfaceData.perceptualSmoothness ) );
				#endif

				// debug
				#if defined(DEBUG_DISPLAY)
				if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				{
					surfaceData.metallic = 0;
				}
				ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
				#endif
			}

			void GetSurfaceAndBuiltinData(SmoothSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
				LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				ApplyDoubleSidedFlipOrMirror( fragInputs, doubleSidedConstants );

				#ifdef _ALPHATEST_ON
				DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#ifdef _DEPTHOFFSET_ON
				builtinData.depthOffset = surfaceDescription.DepthOffset;
				ApplyDepthOffsetPositionInput( V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput );
				#endif

				float3 bentNormalWS;
				BuildSurfaceData( fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS );

				InitBuiltinData( posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[ 2 ], fragInputs.texCoord1, fragInputs.texCoord2, builtinData );

				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			#if defined(WRITE_DECAL_BUFFER) && !defined(_DISABLE_DECALS)
				#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalPrepassBuffer.hlsl"
			#endif
			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh )
			{
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS;

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, outputPackedVaryingsMeshToPS);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( outputPackedVaryingsMeshToPS );

				int m_switch3050_g3455 = _Global_Wind_Main_Fade_Enabled;
				int m_switch2453_g3455 = _WindMode;
				float3 m_Off2453_g3455 = float3(0,0,0);
				float3 VERTEX_POSITION_MATRIX2352_g3455 = mul( GetObjectToWorldMatrix(), float4( inputMesh.positionOS , 0.0 ) ).xyz;
				float3 break2265_g3455 = VERTEX_POSITION_MATRIX2352_g3455;
				int WIND_MODE2462_g3455 = _WindMode;
				int m_switch2458_g3455 = WIND_MODE2462_g3455;
				float m_Off2458_g3455 = 1.0;
				float m_Global2458_g3455 = ( _GlobalWindInfluenceOther * _Global_Wind_Main_Intensity );
				float m_Local2458_g3455 = _LocalWindStrength;
				float localWind_Globalfloatswitch2458_g3455 = Wind_Globalfloatswitch( m_switch2458_g3455 , m_Off2458_g3455 , m_Global2458_g3455 , m_Local2458_g3455 );
				float _WIND_STRENGHT2400_g3455 = localWind_Globalfloatswitch2458_g3455;
				int m_switch2468_g3455 = WIND_MODE2462_g3455;
				float m_Off2468_g3455 = 1.0;
				float m_Global2468_g3455 = _Global_Wind_Main_RandomOffset;
				float m_Local2468_g3455 = _LocalRandomWindOffset;
				float localWind_Globalfloatswitch2468_g3455 = Wind_Globalfloatswitch( m_switch2468_g3455 , m_Off2468_g3455 , m_Global2468_g3455 , m_Local2468_g3455 );
				float4 transform3073_g3455 = mul(GetObjectToWorldMatrix(),float4( 0,0,0,1 ));
				transform3073_g3455.xyz = GetAbsolutePositionWS((transform3073_g3455).xyz);
				float2 appendResult2307_g3455 = (float2(transform3073_g3455.x , transform3073_g3455.z));
				float dotResult2341_g3455 = dot( appendResult2307_g3455 , float2( 12.9898,78.233 ) );
				float lerpResult2238_g3455 = lerp( 0.8 , ( ( localWind_Globalfloatswitch2468_g3455 / 2.0 ) + 0.9 ) , frac( ( sin( dotResult2341_g3455 ) * 43758.55 ) ));
				float _WIND_RANDOM_OFFSET2244_g3455 = ( ( _TimeParameters.x * 0.05 ) * lerpResult2238_g3455 );
				float _WIND_TUBULENCE_RANDOM2274_g3455 = ( sin( ( ( _WIND_RANDOM_OFFSET2244_g3455 * 40.0 ) - ( VERTEX_POSITION_MATRIX2352_g3455.z / 15.0 ) ) ) * 0.5 );
				int m_switch2312_g3455 = WIND_MODE2462_g3455;
				float m_Off2312_g3455 = 1.0;
				float m_Global2312_g3455 = _Global_Wind_Main_Pulse;
				float m_Local2312_g3455 = _LocalWindPulse;
				float localWind_Globalfloatswitch2312_g3455 = Wind_Globalfloatswitch( m_switch2312_g3455 , m_Off2312_g3455 , m_Global2312_g3455 , m_Local2312_g3455 );
				float _WIND_PULSE2421_g3455 = localWind_Globalfloatswitch2312_g3455;
				float FUNC_Angle2470_g3455 = ( _WIND_STRENGHT2400_g3455 * ( 1.0 + sin( ( ( ( ( _WIND_RANDOM_OFFSET2244_g3455 * 2.0 ) + _WIND_TUBULENCE_RANDOM2274_g3455 ) - ( VERTEX_POSITION_MATRIX2352_g3455.z / 50.0 ) ) - ( inputMesh.ase_color.r / 20.0 ) ) ) ) * sqrt( inputMesh.ase_color.r ) * _WIND_PULSE2421_g3455 );
				float FUNC_Angle_SinA2424_g3455 = sin( FUNC_Angle2470_g3455 );
				float FUNC_Angle_CosA2362_g3455 = cos( FUNC_Angle2470_g3455 );
				int m_switch2456_g3455 = WIND_MODE2462_g3455;
				float m_Off2456_g3455 = 1.0;
				float m_Global2456_g3455 = _Global_Wind_Main_Direction;
				float m_Local2456_g3455 = _LocalWindDirection;
				float localWind_Globalfloatswitch2456_g3455 = Wind_Globalfloatswitch( m_switch2456_g3455 , m_Off2456_g3455 , m_Global2456_g3455 , m_Local2456_g3455 );
				float _WindDirection2249_g3455 = localWind_Globalfloatswitch2456_g3455;
				float2 localDirectionalEquation2249_g3455 = DirectionalEquation( _WindDirection2249_g3455 );
				float2 break2469_g3455 = localDirectionalEquation2249_g3455;
				float _WIND_DIRECTION_X2418_g3455 = break2469_g3455.x;
				float lerpResult2258_g3455 = lerp( break2265_g3455.x , ( ( break2265_g3455.y * FUNC_Angle_SinA2424_g3455 ) + ( break2265_g3455.x * FUNC_Angle_CosA2362_g3455 ) ) , _WIND_DIRECTION_X2418_g3455);
				float3 break2340_g3455 = VERTEX_POSITION_MATRIX2352_g3455;
				float3 break2233_g3455 = VERTEX_POSITION_MATRIX2352_g3455;
				float _WIND_DIRECTION_Y2416_g3455 = break2469_g3455.y;
				float lerpResult2275_g3455 = lerp( break2233_g3455.z , ( ( break2233_g3455.y * FUNC_Angle_SinA2424_g3455 ) + ( break2233_g3455.z * FUNC_Angle_CosA2362_g3455 ) ) , _WIND_DIRECTION_Y2416_g3455);
				float3 appendResult2235_g3455 = (float3(lerpResult2258_g3455 , ( ( break2340_g3455.y * FUNC_Angle_CosA2362_g3455 ) - ( break2340_g3455.z * FUNC_Angle_SinA2424_g3455 ) ) , lerpResult2275_g3455));
				float3 VERTEX_POSITION2282_g3455 = ( mul( GetWorldToObjectMatrix(), float4( appendResult2235_g3455 , 0.0 ) ).xyz - inputMesh.positionOS );
				float3 m_Global2453_g3455 = VERTEX_POSITION2282_g3455;
				float3 m_Local2453_g3455 = VERTEX_POSITION2282_g3455;
				float3 localWind_Globalfloat3switch2453_g3455 = Wind_Globalfloat3switch( m_switch2453_g3455 , m_Off2453_g3455 , m_Global2453_g3455 , m_Local2453_g3455 );
				float3 m_Off3050_g3455 = localWind_Globalfloat3switch2453_g3455;
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				float temp_output_3048_0_g3455 = saturate( pow( ( distance( _WorldSpaceCameraPos , ase_worldPos ) / _Global_Wind_Main_Fade_Bias ) , 5.0 ) );
				float3 m_ActiveFadeOut3050_g3455 = ( localWind_Globalfloat3switch2453_g3455 * ( 1.0 - temp_output_3048_0_g3455 ) );
				float3 m_ActiveFadeIn3050_g3455 = ( localWind_Globalfloat3switch2453_g3455 * temp_output_3048_0_g3455 );
				float3 localWind_Fadefloat3switch3050_g3455 = Wind_Fadefloat3switch3050_g3455( m_switch3050_g3455 , m_Off3050_g3455 , m_ActiveFadeOut3050_g3455 , m_ActiveFadeIn3050_g3455 );
				float3 temp_output_309_0_g38532 = localWind_Fadefloat3switch3050_g3455;
				
				outputPackedVaryingsMeshToPS.ase_texcoord3.xy = inputMesh.ase_texcoord.xy;
				outputPackedVaryingsMeshToPS.ase_color = inputMesh.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord3.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = temp_output_309_0_g38532;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS =  inputMesh.normalOS ;
				inputMesh.tangentOS =  inputMesh.tangentOS ;

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				float3 normalWS = TransformObjectToWorldNormal(inputMesh.normalOS);
				float4 tangentWS = float4(TransformObjectToWorldDir(inputMesh.tangentOS.xyz), inputMesh.tangentOS.w);

				outputPackedVaryingsMeshToPS.positionCS = TransformWorldToHClip(positionRWS);
				outputPackedVaryingsMeshToPS.interp00.xyz = positionRWS;
				outputPackedVaryingsMeshToPS.interp01.xyz = normalWS;
				outputPackedVaryingsMeshToPS.interp02.xyzw = tangentWS;
				return outputPackedVaryingsMeshToPS;
			}
			
			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				o.ase_color = v.ase_color;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif

			#if defined(WRITE_NORMAL_BUFFER) && defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_DECAL SV_Target2
			#elif defined(WRITE_NORMAL_BUFFER) || defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_DECAL SV_Target1
			#else
			#define SV_TARGET_DECAL SV_Target0
			#endif

			void Frag( PackedVaryingsMeshToPS packedInput
						#if defined(SCENESELECTIONPASS) || defined(SCENEPICKINGPASS)
						, out float4 outColor : SV_Target0
						#else
							#ifdef WRITE_MSAA_DEPTH
							// We need the depth color as SV_Target0 for alpha to coverage
							, out float4 depthColor : SV_Target0
								#ifdef WRITE_NORMAL_BUFFER
								, out float4 outNormalBuffer : SV_Target1
								#endif
							#else
								#ifdef WRITE_NORMAL_BUFFER
								, out float4 outNormalBuffer : SV_Target0
								#endif
							#endif

							// Decal buffer must be last as it is bind but we can optionally write into it (based on _DISABLE_DECALS)
							#if defined(WRITE_DECAL_BUFFER) && !defined(_DISABLE_DECALS)
							, out float4 outDecalBuffer : SV_TARGET_DECAL
							#endif
						#endif

						#if defined(_DEPTHOFFSET_ON) && !defined(SCENEPICKINGPASS)
						, out float outputDepth : SV_Depth
						#endif
						
					)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				UNITY_SETUP_INSTANCE_ID( packedInput );

				float3 positionRWS = packedInput.interp00.xyz;
				float3 normalWS = packedInput.interp01.xyz;
				float4 tangentWS = packedInput.interp02.xyzw;

				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);

				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.positionCS;

				input.positionRWS = positionRWS;
				input.tangentToWorld = BuildTangentToWorld(tangentWS, normalWS);

				#if _DOUBLESIDED_ON && SHADER_STAGE_FRAGMENT
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false);
				#elif SHADER_STAGE_FRAGMENT
				#if defined(ASE_NEED_CULLFACE)
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false );
				#endif
				#endif
				half isFrontFace = input.isFrontFace;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

				float3 V = GetWorldSpaceNormalizeViewDir(input.positionRWS);

				SmoothSurfaceDescription surfaceDescription = (SmoothSurfaceDescription)0;
				float2 appendResult150_g38532 = (float2(_TilingX , _TilingY));
				float2 appendResult151_g38532 = (float2(_OffsetX , _OffsetY));
				float2 texCoord2_g43136 = packedInput.ase_texcoord3.xy * appendResult150_g38532 + appendResult151_g38532;
				float2 OUT_UV431_g38532 = texCoord2_g43136;
				float2 UV40_g43133 = OUT_UV431_g38532;
				float4 OUT_NORMAL1178_g38532 = SAMPLE_TEXTURE2D( _BumpMap, sampler_trilinear_repeat, UV40_g43133 );
				float4 temp_output_1_0_g43120 = OUT_NORMAL1178_g38532;
				float temp_output_8_0_g43120 = _NormalStrength;
				float3 unpack52_g43120 = UnpackNormalScale( temp_output_1_0_g43120, temp_output_8_0_g43120 );
				unpack52_g43120.z = lerp( 1, unpack52_g43120.z, saturate(temp_output_8_0_g43120) );
				float3 temp_output_1478_59_g38532 = unpack52_g43120;
				float3 temp_output_38_0_g43147 = temp_output_1478_59_g38532;
				float3 Normal_XYZ260_g43147 = temp_output_38_0_g43147;
				float4 tex2DNode63_g43133 = SAMPLE_TEXTURE2D( _MainTex, sampler_trilinear_repeat, UV40_g43133 );
				float4 OUT_ALBEDO_RGBA1177_g38532 = tex2DNode63_g43133;
				float3 temp_output_7_0_g38532 = ( (_Color).rgb * (OUT_ALBEDO_RGBA1177_g38532).rgb * _Brightness );
				float4 temp_output_39_0_g43147 = ( float4( temp_output_7_0_g38532 , 0.0 ) + float4(0,0,0,0) );
				float4 break48_g43147 = temp_output_39_0_g43147;
				float Albedo_RGB300_g43147 = ( break48_g43147.x + break48_g43147.y + break48_g43147.z );
				int m_switch319_g43147 = _BlendColor;
				float m_Red319_g43147 = packedInput.ase_color.r;
				float m_Green319_g43147 = packedInput.ase_color.g;
				float m_Blue319_g43147 = packedInput.ase_color.b;
				float localDetail_BlendVCfloatswitch319_g43147 = Detail_BlendVCfloatswitch319_g43147( m_switch319_g43147 , m_Red319_g43147 , m_Green319_g43147 , m_Blue319_g43147 );
				float clampResult47_g43147 = clamp( ( ( ( ( Albedo_RGB300_g43147 - 0.5 ) * ( _DetailBlendInfluence - 0.9 ) ) + ( localDetail_BlendVCfloatswitch319_g43147 - ( _BlendHeight - 0.4 ) ) ) / _DetailBlendSmooth ) , 0.0 , 1.0 );
				float DetailBlend43_g43147 = clampResult47_g43147;
				int EnableDetailMask216_g43147 = _EnableDetailMask;
				int m_switch221_g43147 = EnableDetailMask216_g43147;
				float2 appendResult132_g43147 = (float2(_DetailTilingXDetail , _DetailTilingYDetail));
				float2 appendResult114_g43147 = (float2(_DetailOffsetXDetail , _DetailOffsetYDetail));
				float2 texCoord67_g43147 = packedInput.ase_texcoord3.xy * appendResult132_g43147 + appendResult114_g43147;
				float4 temp_output_1_0_g43148 = SAMPLE_TEXTURE2D( _DetailNormalMap, sampler_trilinear_repeat, texCoord67_g43147 );
				float temp_output_8_0_g43148 = _DetailNormalMapScale;
				float3 unpack52_g43148 = UnpackNormalScale( temp_output_1_0_g43148, temp_output_8_0_g43148 );
				unpack52_g43148.z = lerp( 1, unpack52_g43148.z, saturate(temp_output_8_0_g43148) );
				float3 Detail_Normal199_g43147 = unpack52_g43148;
				float3 m_Off221_g43147 = Detail_Normal199_g43147;
				float2 appendResult219_g43147 = (float2(_DetailTilingXDetailMask , _DetailTilingYDetailMask));
				float2 appendResult206_g43147 = (float2(_DetailOffsetXDetailMask , _DetailOffsetYDetailMask));
				float2 texCoord220_g43147 = packedInput.ase_texcoord3.xy * appendResult219_g43147 + appendResult206_g43147;
				float temp_output_15_0_g43150 = ( 1.0 - SAMPLE_TEXTURE2D( _DetailMaskMap, sampler_trilinear_repeat, texCoord220_g43147 ).r );
				float temp_output_26_0_g43150 = _Detail_BlendAmountMask;
				float temp_output_24_0_g43150 = _Detail_BlendHardnessMask;
				float saferPower2_g43150 = abs( max( saturate( (0.0 + (temp_output_15_0_g43150 - ( 1.0 - temp_output_26_0_g43150 )) * (temp_output_24_0_g43150 - 0.0) / (1.0 - ( 1.0 - temp_output_26_0_g43150 ))) ) , 0.0 ) );
				float temp_output_22_0_g43150 = _Detail_BlendFalloffMask;
				float temp_output_403_0_g43147 = saturate( pow( saferPower2_g43150 , ( 1.0 - temp_output_22_0_g43150 ) ) );
				float3 lerpResult205_g43147 = lerp( Normal_XYZ260_g43147 , Detail_Normal199_g43147 , temp_output_403_0_g43147);
				float3 m_Active221_g43147 = saturate( lerpResult205_g43147 );
				float saferPower11_g43150 = abs( max( saturate( (1.0 + (temp_output_15_0_g43150 - temp_output_26_0_g43150) * (( 1.0 - temp_output_24_0_g43150 ) - 1.0) / (0.0 - temp_output_26_0_g43150)) ) , 0.0 ) );
				float temp_output_403_21_g43147 = saturate( pow( saferPower11_g43150 , temp_output_22_0_g43150 ) );
				float3 lerpResult406_g43147 = lerp( Detail_Normal199_g43147 , Normal_XYZ260_g43147 , temp_output_403_21_g43147);
				float3 m_ActiveInverted221_g43147 = saturate( lerpResult406_g43147 );
				float3 localDetail_Maskfloat3switch221_g43147 = Detail_Maskfloat3switch221_g43147( m_switch221_g43147 , m_Off221_g43147 , m_Active221_g43147 , m_ActiveInverted221_g43147 );
				float3 Mask_Normal222_g43147 = localDetail_Maskfloat3switch221_g43147;
				float layeredBlendVar413_g43147 = DetailBlend43_g43147;
				float3 layeredBlend413_g43147 = ( lerp( Mask_Normal222_g43147,Normal_XYZ260_g43147 , layeredBlendVar413_g43147 ) );
				float3 normalizeResult414_g43147 = normalize( layeredBlend413_g43147 );
				float3 temp_output_416_0_g43147 = BlendNormal( normalizeResult414_g43147 , Normal_XYZ260_g43147 );
				float EnebleMode122_g43147 = _EnableDetailMap;
				float3 lerpResult410_g43147 = lerp( Normal_XYZ260_g43147 , temp_output_416_0_g43147 , EnebleMode122_g43147);
				
				int temp_output_223_0_g43132 = _SmoothnessSource;
				int m_switch215_g43132 = temp_output_223_0_g43132;
				float4 _MASK_G1438_g38532 = SAMPLE_TEXTURE2D( _SmoothnessMap, sampler_trilinear_repeat, UV40_g43133 );
				float4 temp_cast_4 = (_SmoothnessMin).xxxx;
				float4 temp_cast_5 = (_SmoothnessMax).xxxx;
				float4 temp_output_216_0_g43132 = (temp_cast_4 + (_MASK_G1438_g38532 - float4( 0,0,0,0 )) * (temp_cast_5 - temp_cast_4) / (float4( 1,1,1,1 ) - float4( 0,0,0,0 )));
				float4 m_Smoothness215_g43132 = temp_output_216_0_g43132;
				float4 temp_cast_6 = (_SmoothnessMin).xxxx;
				float4 temp_cast_7 = (_SmoothnessMax).xxxx;
				float4 temp_output_214_0_g43132 = ( 1.0 - temp_output_216_0_g43132 );
				float4 m_Roughness215_g43132 = temp_output_214_0_g43132;
				float4 temp_cast_8 = (_SmoothnessMin).xxxx;
				float4 temp_cast_9 = (_SmoothnessMax).xxxx;
				float3 NORMAL_WORLD_OUT164_g38532 = temp_output_1478_59_g38532;
				float3 temp_output_4_0_g43132 = NORMAL_WORLD_OUT164_g38532;
				float3 temp_output_178_0_g43132 = ddx( temp_output_4_0_g43132 );
				float dotResult195_g43132 = dot( temp_output_178_0_g43132 , temp_output_178_0_g43132 );
				float3 temp_output_175_0_g43132 = ddy( temp_output_4_0_g43132 );
				float dotResult201_g43132 = dot( temp_output_175_0_g43132 , temp_output_175_0_g43132 );
				float4 break377_g38532 = OUT_ALBEDO_RGBA1177_g38532;
				float ALBEDO_R169_g38532 = break377_g38532.r;
				float4 temp_cast_10 = (ALBEDO_R169_g38532).xxxx;
				float4 m_Geometric215_g43132 = ( sqrt( saturate( ( temp_output_216_0_g43132 + ( ( dotResult195_g43132 + dotResult201_g43132 ) * 2.0 ) ) ) ) * ( 1.0 - temp_cast_10 ) );
				float4 localSmoothnessTypefloat4switch215_g43132 = SmoothnessTypefloat4switch215_g43132( m_switch215_g43132 , m_Smoothness215_g43132 , m_Roughness215_g43132 , m_Geometric215_g43132 );
				float4 temp_output_1556_33_g38532 = localSmoothnessTypefloat4switch215_g43132;
				float4 PBR_Occlusion1641_g38532 = SAMPLE_TEXTURE2D( _OcclusionMap, sampler_trilinear_repeat, UV40_g43133 );
				float temp_output_16_0_g43125 = _OcclusionStrengthAO;
				float temp_output_65_0_g43125 = ( 1.0 - temp_output_16_0_g43125 );
				float3 appendResult69_g43125 = (float3(temp_output_65_0_g43125 , temp_output_65_0_g43125 , temp_output_65_0_g43125));
				float4 color77_g43125 = IsGammaSpace() ? float4(1,1,1,1) : float4(1,1,1,1);
				float4 temp_cast_13 = (packedInput.ase_color.a).xxxx;
				float4 lerpResult75_g43125 = lerp( color77_g43125 , temp_cast_13 , temp_output_16_0_g43125);
				float4 lerpResult83_g43125 = lerp( float4( ( ( ( (PBR_Occlusion1641_g38532).xyz - float3( 0.5,0.5,0.5 ) ) * temp_output_16_0_g43125 ) + appendResult69_g43125 ) , 0.0 ) , lerpResult75_g43125 , _OcclusionSource);
				float4 Occlusion1550_g38532 = saturate( lerpResult83_g43125 );
				
				surfaceDescription.Normal = lerpResult410_g43147;
				surfaceDescription.Smoothness = ( temp_output_1556_33_g38532 * Occlusion1550_g38532 ).x;
				surfaceDescription.Alpha = break377_g38532.a;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = _AlphaCutoff;
				#endif

				#ifdef _DEPTHOFFSET_ON
				surfaceDescription.DepthOffset = 0;
				#endif

				SurfaceData surfaceData;
				BuiltinData builtinData;
				GetSurfaceAndBuiltinData(surfaceDescription, input, V, posInput, surfaceData, builtinData);

				#ifdef _DEPTHOFFSET_ON
				outputDepth = posInput.deviceDepth;
				#endif

				#ifdef WRITE_NORMAL_BUFFER
				EncodeIntoNormalBuffer( ConvertSurfaceDataToNormalData( surfaceData ), posInput.positionSS, outNormalBuffer );
				#ifdef WRITE_MSAA_DEPTH
				depthColor = packedInput.positionCS.z;
				#endif
				#elif defined(WRITE_MSAA_DEPTH)
				//outNormalBuffer = float4( 0.0, 0.0, 0.0, 1.0 );
				depthColor = packedInput.positionCS.z;
				#elif defined(SCENESELECTIONPASS)
				outColor = float4( _ObjectId, _PassValue, 1.0, 1.0 );
				#endif

				#if defined(WRITE_DECAL_BUFFER) && !defined(_DISABLE_DECALS)
				DecalPrepassData decalPrepassData;
				decalPrepassData.geomNormalWS = surfaceData.geomNormalWS;
				decalPrepassData.decalLayerMask = GetMeshRenderingDecalLayer();
				EncodeIntoDecalPrepassBuffer(decalPrepassData, outDecalBuffer);
				#endif
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "Motion Vectors"
			Tags { "LightMode"="MotionVectors" }

			Cull [_CullMode]

			ZWrite On

			Stencil
			{
				Ref [_StencilRefMV]
				WriteMask [_StencilWriteMaskMV]
				Comp Always
				Pass Replace
				Fail Keep
				ZFail Keep
			}


			HLSLPROGRAM

			#define _ALPHATEST_SHADOW_ON 1
			#define _SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL 1
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_BENT_NORMAL 1
			#define _AMBIENT_OCCLUSION 1
			#define HAVE_MESH_MODIFICATION
			#define ASE_SRP_VERSION 100400
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local _DOUBLESIDED_ON
			#pragma shader_feature_local _ _BLENDMODE_ALPHA _BLENDMODE_ADD _BLENDMODE_PRE_MULTIPLY
			#pragma shader_feature_local _ENABLE_FOG_ON_TRANSPARENT
			#pragma shader_feature_local _ALPHATEST_ON

			#define SHADERPASS SHADERPASS_MOTION_VECTORS
			#pragma multi_compile _ WRITE_NORMAL_BUFFER
			#pragma multi_compile _ WRITE_MSAA_DEPTH

			#pragma vertex Vert
			#pragma fragment Frag

			//#define UNITY_MATERIAL_LIT

			#if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
			#endif

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl"


			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#ifdef DEBUG_DISPLAY
				#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
			#endif
			
			CBUFFER_START( UnityPerMaterial )
			float4 _Smoothness;
			half4 _ColorDetail;
			float4 _Color;
			float _SmoothnessMax;
			half _DetailOffsetXDetailMask;
			half _DetailOffsetYDetailMask;
			half _Detail_BlendAmountMask;
			half _Detail_BlendHardnessMask;
			half _Detail_BlendFalloffMask;
			half _DetailBlendInfluence;
			int _BlendColor;
			half _BlendHeight;
			half _DetailBlendSmooth;
			float _EnableDetailMap;
			half _NormalStrength;
			half _DetailNormalMapScale;
			int _NormalMapSpace;
			half _NormalStrengthBent;
			float _MetallicStrength;
			int _SmoothnessSource;
			float _OcclusionStrengthAO;
			float _OcclusionSource;
			float _AlphaCutoffShadow;
			float _SpecularAAScreenSpaceVariance;
			float _DetailTilingYDetailMask;
			float _DetailTilingXDetailMask;
			half _DetailOffsetXDetail;
			float _EnableGeometricSpecularAA;
			float _SmoothnessMin;
			float _DoubleSidedGIMode;
			half _EmissionFlags;
			float _TransparentWritingMotionVec;
			float _EnableBlendModePreserveSpecularLighting;
			float _AlphaToMaskInspectorValue;
			int _OpaqueCullMode;
			int _WindMode;
			float _GlobalWindInfluenceOther;
			float _LocalWindStrength;
			float _LocalRandomWindOffset;
			float _LocalWindPulse;
			float _LocalWindDirection;
			float _TilingX;
			float _TilingY;
			float _OffsetX;
			float _OffsetY;
			half _Brightness;
			int _EnableDetailMask;
			float _DetailTilingXDetail;
			float _DetailTilingYDetail;
			half _DetailOffsetYDetail;
			float _SpecularAAThreshold;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			int _Global_Wind_Main_Fade_Enabled;
			float _Global_Wind_Main_Intensity;
			float _Global_Wind_Main_RandomOffset;
			float _Global_Wind_Main_Pulse;
			float _Global_Wind_Main_Direction;
			float _Global_Wind_Main_Fade_Bias;
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_trilinear_repeat);
			TEXTURE2D(_MainTex);
			TEXTURE2D(_DetailNormalMap);
			TEXTURE2D(_DetailMaskMap);
			TEXTURE2D(_SmoothnessMap);
			TEXTURE2D(_OcclusionMap);


			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_FRAG_COLOR
			#pragma instancing_options procedural:SetupNatureRenderer forwardadd
			#pragma multi_compile GPU_FRUSTUM_ON __
			#include "Nature Renderer.cginc"
			#pragma multi_compile_local _ NATURE_RENDERER
			#pragma shader_feature_local _ALPHATOMASK_ON
			#pragma shader_feature_local _ _VERTEX_DISPLACEMENT _PIXEL_DISPLACEMENT
			#pragma shader_feature_local_vertex _VERTEX_DISPLACEMENT_LOCK_OBJECT_SCALE
			#pragma shader_feature_local _DISPLACEMENT_LOCK_TILING_SCALE
			#pragma shader_feature_local_fragment _PIXEL_DISPLACEMENT_LOCK_OBJECT_SCALE


			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
				#define ASE_NEED_CULLFACE 1
			#endif


			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float3 previousPositionOS : TEXCOORD4;
				#if defined (_ADD_PRECOMPUTED_VELOCITY)
					float3 precomputedVelocity : TEXCOORD5;
				#endif
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				float4 vmeshPositionCS : SV_Position;
				float3 vmeshInterp00 : TEXCOORD0;
				float3 vpassInterpolators0 : TEXCOORD1; //interpolators0
				float3 vpassInterpolators1 : TEXCOORD2; //interpolators1
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};


			float Wind_Globalfloatswitch( int m_switch, float m_Off, float m_Global, float m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float(0);
			}
			
			float2 DirectionalEquation( float _WindDirection )
			{
				float d = _WindDirection * 0.0174532924;
				float xL = cos(d) + 1 / 2;
				float zL = sin(d) + 1 / 2;
				return float2(zL,xL);
			}
			
			float3 Wind_Globalfloat3switch( int m_switch, float3 m_Off, float3 m_Global, float3 m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float3(0,0,0);
			}
			
			float3 Wind_Fadefloat3switch3050_g3455( int m_switch, float3 m_Off, float3 m_ActiveFadeOut, float3 m_ActiveFadeIn )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_ActiveFadeOut;
				else if(m_switch ==2)
					return m_ActiveFadeIn;
				else
				return float3(0,0,0);
			}
			
			float Detail_BlendVCfloatswitch319_g43147( int m_switch, float m_Red, float m_Green, float m_Blue )
			{
				if(m_switch ==0)
					return m_Red;
				else if(m_switch ==1)
					return m_Green;
				else if(m_switch ==2)
					return m_Blue;
				else
				return float(0);
			}
			
			float3 Detail_Maskfloat3switch221_g43147( int m_switch, float3 m_Off, float3 m_Active, float3 m_ActiveInverted )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else if(m_switch ==2)
					return m_ActiveInverted;
				else
				return float3(0,0,0);
			}
			
			float4 SmoothnessTypefloat4switch215_g43132( int m_switch, float4 m_Smoothness, float4 m_Roughness, float4 m_Geometric )
			{
				if(m_switch ==0)
					return m_Smoothness;
				else if(m_switch ==1)
					return m_Roughness;
				else if(m_switch ==2)
					return m_Geometric;
				else
				return float4(0,0,0,0);
			}
			

			void BuildSurfaceData(FragInputs fragInputs, inout SmoothSurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.specularOcclusion = 1.0;

				// surface data
				surfaceData.perceptualSmoothness =		surfaceDescription.Smoothness;

				// refraction
				#ifdef _HAS_REFRACTION
				if( _EnableSSRefraction )
				{
					surfaceData.transmittanceMask = ( 1.0 - surfaceDescription.Alpha );
					surfaceDescription.Alpha = 1.0;
				}
				else
				{
					surfaceData.ior = 1.0;
					surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
					surfaceData.atDistance = 1.0;
					surfaceData.transmittanceMask = 0.0;
					surfaceDescription.Alpha = 1.0;
				}
				#else
				surfaceData.ior = 1.0;
				surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
				surfaceData.atDistance = 1.0;
				surfaceData.transmittanceMask = 0.0;
				#endif


				// material features
				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
				#endif
				#ifdef ASE_LIT_CLEAR_COAT
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				// others
				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
				surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif
				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				// normals
				float3 normalTS = float3(0.0f, 0.0f, 1.0f);
				normalTS = surfaceDescription.Normal;
				GetNormalWS( fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants );

				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
				surfaceData.tangentWS = normalize( fragInputs.tangentToWorld[ 0 ].xyz );

				// decals
				#if HAVE_DECALS
				if( _EnableDecals )
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs.tangentToWorld[2], surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
				#endif

				bentNormalWS = surfaceData.normalWS;
				surfaceData.tangentWS = Orthonormalize( surfaceData.tangentWS, surfaceData.normalWS );

				#if defined(_SPECULAR_OCCLUSION_CUSTOM)
				#elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO( V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness( surfaceData.perceptualSmoothness ) );
				#elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion( ClampNdotV( dot( surfaceData.normalWS, V ) ), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness( surfaceData.perceptualSmoothness ) );
				#endif

				// debug
				#if defined(DEBUG_DISPLAY)
				if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				{
					surfaceData.metallic = 0;
				}
				ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
				#endif
			}

			void GetSurfaceAndBuiltinData(SmoothSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
				LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				ApplyDoubleSidedFlipOrMirror( fragInputs, doubleSidedConstants );

				#ifdef _ALPHATEST_ON
				DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#ifdef _DEPTHOFFSET_ON
				builtinData.depthOffset = surfaceDescription.DepthOffset;
				ApplyDepthOffsetPositionInput( V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput );
				#endif

				float3 bentNormalWS;
				BuildSurfaceData( fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS );

				InitBuiltinData( posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[ 2 ], fragInputs.texCoord1, fragInputs.texCoord2, builtinData );

				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			AttributesMesh ApplyMeshModification(AttributesMesh inputMesh, float3 timeParameters, inout PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS )
			{
				_TimeParameters.xyz = timeParameters;
				int m_switch3050_g3455 = _Global_Wind_Main_Fade_Enabled;
				int m_switch2453_g3455 = _WindMode;
				float3 m_Off2453_g3455 = float3(0,0,0);
				float3 VERTEX_POSITION_MATRIX2352_g3455 = mul( GetObjectToWorldMatrix(), float4( inputMesh.positionOS , 0.0 ) ).xyz;
				float3 break2265_g3455 = VERTEX_POSITION_MATRIX2352_g3455;
				int WIND_MODE2462_g3455 = _WindMode;
				int m_switch2458_g3455 = WIND_MODE2462_g3455;
				float m_Off2458_g3455 = 1.0;
				float m_Global2458_g3455 = ( _GlobalWindInfluenceOther * _Global_Wind_Main_Intensity );
				float m_Local2458_g3455 = _LocalWindStrength;
				float localWind_Globalfloatswitch2458_g3455 = Wind_Globalfloatswitch( m_switch2458_g3455 , m_Off2458_g3455 , m_Global2458_g3455 , m_Local2458_g3455 );
				float _WIND_STRENGHT2400_g3455 = localWind_Globalfloatswitch2458_g3455;
				int m_switch2468_g3455 = WIND_MODE2462_g3455;
				float m_Off2468_g3455 = 1.0;
				float m_Global2468_g3455 = _Global_Wind_Main_RandomOffset;
				float m_Local2468_g3455 = _LocalRandomWindOffset;
				float localWind_Globalfloatswitch2468_g3455 = Wind_Globalfloatswitch( m_switch2468_g3455 , m_Off2468_g3455 , m_Global2468_g3455 , m_Local2468_g3455 );
				float4 transform3073_g3455 = mul(GetObjectToWorldMatrix(),float4( 0,0,0,1 ));
				transform3073_g3455.xyz = GetAbsolutePositionWS((transform3073_g3455).xyz);
				float2 appendResult2307_g3455 = (float2(transform3073_g3455.x , transform3073_g3455.z));
				float dotResult2341_g3455 = dot( appendResult2307_g3455 , float2( 12.9898,78.233 ) );
				float lerpResult2238_g3455 = lerp( 0.8 , ( ( localWind_Globalfloatswitch2468_g3455 / 2.0 ) + 0.9 ) , frac( ( sin( dotResult2341_g3455 ) * 43758.55 ) ));
				float _WIND_RANDOM_OFFSET2244_g3455 = ( ( _TimeParameters.x * 0.05 ) * lerpResult2238_g3455 );
				float _WIND_TUBULENCE_RANDOM2274_g3455 = ( sin( ( ( _WIND_RANDOM_OFFSET2244_g3455 * 40.0 ) - ( VERTEX_POSITION_MATRIX2352_g3455.z / 15.0 ) ) ) * 0.5 );
				int m_switch2312_g3455 = WIND_MODE2462_g3455;
				float m_Off2312_g3455 = 1.0;
				float m_Global2312_g3455 = _Global_Wind_Main_Pulse;
				float m_Local2312_g3455 = _LocalWindPulse;
				float localWind_Globalfloatswitch2312_g3455 = Wind_Globalfloatswitch( m_switch2312_g3455 , m_Off2312_g3455 , m_Global2312_g3455 , m_Local2312_g3455 );
				float _WIND_PULSE2421_g3455 = localWind_Globalfloatswitch2312_g3455;
				float FUNC_Angle2470_g3455 = ( _WIND_STRENGHT2400_g3455 * ( 1.0 + sin( ( ( ( ( _WIND_RANDOM_OFFSET2244_g3455 * 2.0 ) + _WIND_TUBULENCE_RANDOM2274_g3455 ) - ( VERTEX_POSITION_MATRIX2352_g3455.z / 50.0 ) ) - ( inputMesh.ase_color.r / 20.0 ) ) ) ) * sqrt( inputMesh.ase_color.r ) * _WIND_PULSE2421_g3455 );
				float FUNC_Angle_SinA2424_g3455 = sin( FUNC_Angle2470_g3455 );
				float FUNC_Angle_CosA2362_g3455 = cos( FUNC_Angle2470_g3455 );
				int m_switch2456_g3455 = WIND_MODE2462_g3455;
				float m_Off2456_g3455 = 1.0;
				float m_Global2456_g3455 = _Global_Wind_Main_Direction;
				float m_Local2456_g3455 = _LocalWindDirection;
				float localWind_Globalfloatswitch2456_g3455 = Wind_Globalfloatswitch( m_switch2456_g3455 , m_Off2456_g3455 , m_Global2456_g3455 , m_Local2456_g3455 );
				float _WindDirection2249_g3455 = localWind_Globalfloatswitch2456_g3455;
				float2 localDirectionalEquation2249_g3455 = DirectionalEquation( _WindDirection2249_g3455 );
				float2 break2469_g3455 = localDirectionalEquation2249_g3455;
				float _WIND_DIRECTION_X2418_g3455 = break2469_g3455.x;
				float lerpResult2258_g3455 = lerp( break2265_g3455.x , ( ( break2265_g3455.y * FUNC_Angle_SinA2424_g3455 ) + ( break2265_g3455.x * FUNC_Angle_CosA2362_g3455 ) ) , _WIND_DIRECTION_X2418_g3455);
				float3 break2340_g3455 = VERTEX_POSITION_MATRIX2352_g3455;
				float3 break2233_g3455 = VERTEX_POSITION_MATRIX2352_g3455;
				float _WIND_DIRECTION_Y2416_g3455 = break2469_g3455.y;
				float lerpResult2275_g3455 = lerp( break2233_g3455.z , ( ( break2233_g3455.y * FUNC_Angle_SinA2424_g3455 ) + ( break2233_g3455.z * FUNC_Angle_CosA2362_g3455 ) ) , _WIND_DIRECTION_Y2416_g3455);
				float3 appendResult2235_g3455 = (float3(lerpResult2258_g3455 , ( ( break2340_g3455.y * FUNC_Angle_CosA2362_g3455 ) - ( break2340_g3455.z * FUNC_Angle_SinA2424_g3455 ) ) , lerpResult2275_g3455));
				float3 VERTEX_POSITION2282_g3455 = ( mul( GetWorldToObjectMatrix(), float4( appendResult2235_g3455 , 0.0 ) ).xyz - inputMesh.positionOS );
				float3 m_Global2453_g3455 = VERTEX_POSITION2282_g3455;
				float3 m_Local2453_g3455 = VERTEX_POSITION2282_g3455;
				float3 localWind_Globalfloat3switch2453_g3455 = Wind_Globalfloat3switch( m_switch2453_g3455 , m_Off2453_g3455 , m_Global2453_g3455 , m_Local2453_g3455 );
				float3 m_Off3050_g3455 = localWind_Globalfloat3switch2453_g3455;
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				float temp_output_3048_0_g3455 = saturate( pow( ( distance( _WorldSpaceCameraPos , ase_worldPos ) / _Global_Wind_Main_Fade_Bias ) , 5.0 ) );
				float3 m_ActiveFadeOut3050_g3455 = ( localWind_Globalfloat3switch2453_g3455 * ( 1.0 - temp_output_3048_0_g3455 ) );
				float3 m_ActiveFadeIn3050_g3455 = ( localWind_Globalfloat3switch2453_g3455 * temp_output_3048_0_g3455 );
				float3 localWind_Fadefloat3switch3050_g3455 = Wind_Fadefloat3switch3050_g3455( m_switch3050_g3455 , m_Off3050_g3455 , m_ActiveFadeOut3050_g3455 , m_ActiveFadeIn3050_g3455 );
				float3 temp_output_309_0_g38532 = localWind_Fadefloat3switch3050_g3455;
				
				outputPackedVaryingsMeshToPS.ase_texcoord3.xy = inputMesh.ase_texcoord.xy;
				outputPackedVaryingsMeshToPS.ase_color = inputMesh.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord3.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = temp_output_309_0_g38532;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif
				inputMesh.normalOS =  inputMesh.normalOS ;
				return inputMesh;
			}

			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh)
			{
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS = (PackedVaryingsMeshToPS)0;
				AttributesMesh defaultMesh = inputMesh;

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, outputPackedVaryingsMeshToPS);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( outputPackedVaryingsMeshToPS );

				inputMesh = ApplyMeshModification( inputMesh, _TimeParameters.xyz, outputPackedVaryingsMeshToPS);

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				float3 normalWS = TransformObjectToWorldNormal(inputMesh.normalOS);

				float3 VMESHpositionRWS = positionRWS;
				float4 VMESHpositionCS = TransformWorldToHClip(positionRWS);

				float4 VPASSpreviousPositionCS;
				float4 VPASSpositionCS = mul(UNITY_MATRIX_UNJITTERED_VP, float4(VMESHpositionRWS, 1.0));

				bool forceNoMotion = unity_MotionVectorsParams.y == 0.0;
				if (forceNoMotion)
				{
					VPASSpreviousPositionCS = float4(0.0, 0.0, 0.0, 1.0);
				}
				else
				{
					bool hasDeformation = unity_MotionVectorsParams.x > 0.0;
					float3 effectivePositionOS = (hasDeformation ? inputMesh.previousPositionOS : defaultMesh.positionOS);
					#if defined(_ADD_PRECOMPUTED_VELOCITY)
					effectivePositionOS -= inputMesh.precomputedVelocity;
					#endif

					#if defined(HAVE_MESH_MODIFICATION)
						AttributesMesh previousMesh = defaultMesh;
						previousMesh.positionOS = effectivePositionOS ;
						PackedVaryingsMeshToPS test = (PackedVaryingsMeshToPS)0;
						float3 curTime = _TimeParameters.xyz;
						previousMesh = ApplyMeshModification(previousMesh, _LastTimeParameters.xyz, test);
						_TimeParameters.xyz = curTime;
						float3 previousPositionRWS = TransformPreviousObjectToWorld(previousMesh.positionOS);
					#else
						float3 previousPositionRWS = TransformPreviousObjectToWorld(effectivePositionOS);
					#endif

					#ifdef ATTRIBUTES_NEED_NORMAL
						float3 normalWS = TransformPreviousObjectToWorldNormal(defaultMesh.normalOS);
					#else
						float3 normalWS = float3(0.0, 0.0, 0.0);
					#endif

					#if defined(HAVE_VERTEX_MODIFICATION)
						//ApplyVertexModification(inputMesh, normalWS, previousPositionRWS, _LastTimeParameters.xyz);
					#endif

					VPASSpreviousPositionCS = mul(UNITY_MATRIX_PREV_VP, float4(previousPositionRWS, 1.0));
				}

				outputPackedVaryingsMeshToPS.vmeshPositionCS = VMESHpositionCS;
				outputPackedVaryingsMeshToPS.vmeshInterp00.xyz = VMESHpositionRWS;

				outputPackedVaryingsMeshToPS.vpassInterpolators0 = float3(VPASSpositionCS.xyw);
				outputPackedVaryingsMeshToPS.vpassInterpolators1 = float3(VPASSpreviousPositionCS.xyw);
				return outputPackedVaryingsMeshToPS;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float3 previousPositionOS : TEXCOORD4;
				#if defined (_ADD_PRECOMPUTED_VELOCITY)
					float3 precomputedVelocity : TEXCOORD5;
				#endif
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.previousPositionOS = v.previousPositionOS;
				#if defined (_ADD_PRECOMPUTED_VELOCITY)
				o.precomputedVelocity = v.precomputedVelocity;
				#endif
				o.ase_color = v.ase_color;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.previousPositionOS = patch[0].previousPositionOS * bary.x + patch[1].previousPositionOS * bary.y + patch[2].previousPositionOS * bary.z;
				#if defined (_ADD_PRECOMPUTED_VELOCITY)
					o.precomputedVelocity = patch[0].precomputedVelocity * bary.x + patch[1].precomputedVelocity * bary.y + patch[2].precomputedVelocity * bary.z;
				#endif
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif

			#if defined(WRITE_DECAL_BUFFER) && defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_NORMAL SV_Target3
			#elif defined(WRITE_DECAL_BUFFER) || defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_NORMAL SV_Target2
			#else
			#define SV_TARGET_NORMAL SV_Target1
			#endif

			void Frag( PackedVaryingsMeshToPS packedInput
				#ifdef WRITE_MSAA_DEPTH
					// We need the depth color as SV_Target0 for alpha to coverage
					, out float4 depthColor : SV_Target0
					, out float4 outMotionVector : SV_Target1
						#ifdef WRITE_DECAL_BUFFER
						, out float4 outDecalBuffer : SV_Target2
						#endif
					#else
					// When no MSAA, the motion vector is always the first buffer
					, out float4 outMotionVector : SV_Target0
						#ifdef WRITE_DECAL_BUFFER
						, out float4 outDecalBuffer : SV_Target1
						#endif
					#endif

					// Decal buffer must be last as it is bind but we can optionally write into it (based on _DISABLE_DECALS)
					#ifdef WRITE_NORMAL_BUFFER
					, out float4 outNormalBuffer : SV_TARGET_NORMAL
					#endif

					#ifdef _DEPTHOFFSET_ON
					, out float outputDepth : SV_Depth
					#endif
				
				)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				UNITY_SETUP_INSTANCE_ID( packedInput );
				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.vmeshPositionCS;
				input.positionRWS = packedInput.vmeshInterp00.xyz;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

				float3 V = GetWorldSpaceNormalizeViewDir(input.positionRWS);

				SurfaceData surfaceData;
				BuiltinData builtinData;

				SmoothSurfaceDescription surfaceDescription = (SmoothSurfaceDescription)0;
				float2 appendResult150_g38532 = (float2(_TilingX , _TilingY));
				float2 appendResult151_g38532 = (float2(_OffsetX , _OffsetY));
				float2 texCoord2_g43136 = packedInput.ase_texcoord3.xy * appendResult150_g38532 + appendResult151_g38532;
				float2 OUT_UV431_g38532 = texCoord2_g43136;
				float2 UV40_g43133 = OUT_UV431_g38532;
				float4 OUT_NORMAL1178_g38532 = SAMPLE_TEXTURE2D( _BumpMap, sampler_trilinear_repeat, UV40_g43133 );
				float4 temp_output_1_0_g43120 = OUT_NORMAL1178_g38532;
				float temp_output_8_0_g43120 = _NormalStrength;
				float3 unpack52_g43120 = UnpackNormalScale( temp_output_1_0_g43120, temp_output_8_0_g43120 );
				unpack52_g43120.z = lerp( 1, unpack52_g43120.z, saturate(temp_output_8_0_g43120) );
				float3 temp_output_1478_59_g38532 = unpack52_g43120;
				float3 temp_output_38_0_g43147 = temp_output_1478_59_g38532;
				float3 Normal_XYZ260_g43147 = temp_output_38_0_g43147;
				float4 tex2DNode63_g43133 = SAMPLE_TEXTURE2D( _MainTex, sampler_trilinear_repeat, UV40_g43133 );
				float4 OUT_ALBEDO_RGBA1177_g38532 = tex2DNode63_g43133;
				float3 temp_output_7_0_g38532 = ( (_Color).rgb * (OUT_ALBEDO_RGBA1177_g38532).rgb * _Brightness );
				float4 temp_output_39_0_g43147 = ( float4( temp_output_7_0_g38532 , 0.0 ) + float4(0,0,0,0) );
				float4 break48_g43147 = temp_output_39_0_g43147;
				float Albedo_RGB300_g43147 = ( break48_g43147.x + break48_g43147.y + break48_g43147.z );
				int m_switch319_g43147 = _BlendColor;
				float m_Red319_g43147 = packedInput.ase_color.r;
				float m_Green319_g43147 = packedInput.ase_color.g;
				float m_Blue319_g43147 = packedInput.ase_color.b;
				float localDetail_BlendVCfloatswitch319_g43147 = Detail_BlendVCfloatswitch319_g43147( m_switch319_g43147 , m_Red319_g43147 , m_Green319_g43147 , m_Blue319_g43147 );
				float clampResult47_g43147 = clamp( ( ( ( ( Albedo_RGB300_g43147 - 0.5 ) * ( _DetailBlendInfluence - 0.9 ) ) + ( localDetail_BlendVCfloatswitch319_g43147 - ( _BlendHeight - 0.4 ) ) ) / _DetailBlendSmooth ) , 0.0 , 1.0 );
				float DetailBlend43_g43147 = clampResult47_g43147;
				int EnableDetailMask216_g43147 = _EnableDetailMask;
				int m_switch221_g43147 = EnableDetailMask216_g43147;
				float2 appendResult132_g43147 = (float2(_DetailTilingXDetail , _DetailTilingYDetail));
				float2 appendResult114_g43147 = (float2(_DetailOffsetXDetail , _DetailOffsetYDetail));
				float2 texCoord67_g43147 = packedInput.ase_texcoord3.xy * appendResult132_g43147 + appendResult114_g43147;
				float4 temp_output_1_0_g43148 = SAMPLE_TEXTURE2D( _DetailNormalMap, sampler_trilinear_repeat, texCoord67_g43147 );
				float temp_output_8_0_g43148 = _DetailNormalMapScale;
				float3 unpack52_g43148 = UnpackNormalScale( temp_output_1_0_g43148, temp_output_8_0_g43148 );
				unpack52_g43148.z = lerp( 1, unpack52_g43148.z, saturate(temp_output_8_0_g43148) );
				float3 Detail_Normal199_g43147 = unpack52_g43148;
				float3 m_Off221_g43147 = Detail_Normal199_g43147;
				float2 appendResult219_g43147 = (float2(_DetailTilingXDetailMask , _DetailTilingYDetailMask));
				float2 appendResult206_g43147 = (float2(_DetailOffsetXDetailMask , _DetailOffsetYDetailMask));
				float2 texCoord220_g43147 = packedInput.ase_texcoord3.xy * appendResult219_g43147 + appendResult206_g43147;
				float temp_output_15_0_g43150 = ( 1.0 - SAMPLE_TEXTURE2D( _DetailMaskMap, sampler_trilinear_repeat, texCoord220_g43147 ).r );
				float temp_output_26_0_g43150 = _Detail_BlendAmountMask;
				float temp_output_24_0_g43150 = _Detail_BlendHardnessMask;
				float saferPower2_g43150 = abs( max( saturate( (0.0 + (temp_output_15_0_g43150 - ( 1.0 - temp_output_26_0_g43150 )) * (temp_output_24_0_g43150 - 0.0) / (1.0 - ( 1.0 - temp_output_26_0_g43150 ))) ) , 0.0 ) );
				float temp_output_22_0_g43150 = _Detail_BlendFalloffMask;
				float temp_output_403_0_g43147 = saturate( pow( saferPower2_g43150 , ( 1.0 - temp_output_22_0_g43150 ) ) );
				float3 lerpResult205_g43147 = lerp( Normal_XYZ260_g43147 , Detail_Normal199_g43147 , temp_output_403_0_g43147);
				float3 m_Active221_g43147 = saturate( lerpResult205_g43147 );
				float saferPower11_g43150 = abs( max( saturate( (1.0 + (temp_output_15_0_g43150 - temp_output_26_0_g43150) * (( 1.0 - temp_output_24_0_g43150 ) - 1.0) / (0.0 - temp_output_26_0_g43150)) ) , 0.0 ) );
				float temp_output_403_21_g43147 = saturate( pow( saferPower11_g43150 , temp_output_22_0_g43150 ) );
				float3 lerpResult406_g43147 = lerp( Detail_Normal199_g43147 , Normal_XYZ260_g43147 , temp_output_403_21_g43147);
				float3 m_ActiveInverted221_g43147 = saturate( lerpResult406_g43147 );
				float3 localDetail_Maskfloat3switch221_g43147 = Detail_Maskfloat3switch221_g43147( m_switch221_g43147 , m_Off221_g43147 , m_Active221_g43147 , m_ActiveInverted221_g43147 );
				float3 Mask_Normal222_g43147 = localDetail_Maskfloat3switch221_g43147;
				float layeredBlendVar413_g43147 = DetailBlend43_g43147;
				float3 layeredBlend413_g43147 = ( lerp( Mask_Normal222_g43147,Normal_XYZ260_g43147 , layeredBlendVar413_g43147 ) );
				float3 normalizeResult414_g43147 = normalize( layeredBlend413_g43147 );
				float3 temp_output_416_0_g43147 = BlendNormal( normalizeResult414_g43147 , Normal_XYZ260_g43147 );
				float EnebleMode122_g43147 = _EnableDetailMap;
				float3 lerpResult410_g43147 = lerp( Normal_XYZ260_g43147 , temp_output_416_0_g43147 , EnebleMode122_g43147);
				
				int temp_output_223_0_g43132 = _SmoothnessSource;
				int m_switch215_g43132 = temp_output_223_0_g43132;
				float4 _MASK_G1438_g38532 = SAMPLE_TEXTURE2D( _SmoothnessMap, sampler_trilinear_repeat, UV40_g43133 );
				float4 temp_cast_4 = (_SmoothnessMin).xxxx;
				float4 temp_cast_5 = (_SmoothnessMax).xxxx;
				float4 temp_output_216_0_g43132 = (temp_cast_4 + (_MASK_G1438_g38532 - float4( 0,0,0,0 )) * (temp_cast_5 - temp_cast_4) / (float4( 1,1,1,1 ) - float4( 0,0,0,0 )));
				float4 m_Smoothness215_g43132 = temp_output_216_0_g43132;
				float4 temp_cast_6 = (_SmoothnessMin).xxxx;
				float4 temp_cast_7 = (_SmoothnessMax).xxxx;
				float4 temp_output_214_0_g43132 = ( 1.0 - temp_output_216_0_g43132 );
				float4 m_Roughness215_g43132 = temp_output_214_0_g43132;
				float4 temp_cast_8 = (_SmoothnessMin).xxxx;
				float4 temp_cast_9 = (_SmoothnessMax).xxxx;
				float3 NORMAL_WORLD_OUT164_g38532 = temp_output_1478_59_g38532;
				float3 temp_output_4_0_g43132 = NORMAL_WORLD_OUT164_g38532;
				float3 temp_output_178_0_g43132 = ddx( temp_output_4_0_g43132 );
				float dotResult195_g43132 = dot( temp_output_178_0_g43132 , temp_output_178_0_g43132 );
				float3 temp_output_175_0_g43132 = ddy( temp_output_4_0_g43132 );
				float dotResult201_g43132 = dot( temp_output_175_0_g43132 , temp_output_175_0_g43132 );
				float4 break377_g38532 = OUT_ALBEDO_RGBA1177_g38532;
				float ALBEDO_R169_g38532 = break377_g38532.r;
				float4 temp_cast_10 = (ALBEDO_R169_g38532).xxxx;
				float4 m_Geometric215_g43132 = ( sqrt( saturate( ( temp_output_216_0_g43132 + ( ( dotResult195_g43132 + dotResult201_g43132 ) * 2.0 ) ) ) ) * ( 1.0 - temp_cast_10 ) );
				float4 localSmoothnessTypefloat4switch215_g43132 = SmoothnessTypefloat4switch215_g43132( m_switch215_g43132 , m_Smoothness215_g43132 , m_Roughness215_g43132 , m_Geometric215_g43132 );
				float4 temp_output_1556_33_g38532 = localSmoothnessTypefloat4switch215_g43132;
				float4 PBR_Occlusion1641_g38532 = SAMPLE_TEXTURE2D( _OcclusionMap, sampler_trilinear_repeat, UV40_g43133 );
				float temp_output_16_0_g43125 = _OcclusionStrengthAO;
				float temp_output_65_0_g43125 = ( 1.0 - temp_output_16_0_g43125 );
				float3 appendResult69_g43125 = (float3(temp_output_65_0_g43125 , temp_output_65_0_g43125 , temp_output_65_0_g43125));
				float4 color77_g43125 = IsGammaSpace() ? float4(1,1,1,1) : float4(1,1,1,1);
				float4 temp_cast_13 = (packedInput.ase_color.a).xxxx;
				float4 lerpResult75_g43125 = lerp( color77_g43125 , temp_cast_13 , temp_output_16_0_g43125);
				float4 lerpResult83_g43125 = lerp( float4( ( ( ( (PBR_Occlusion1641_g38532).xyz - float3( 0.5,0.5,0.5 ) ) * temp_output_16_0_g43125 ) + appendResult69_g43125 ) , 0.0 ) , lerpResult75_g43125 , _OcclusionSource);
				float4 Occlusion1550_g38532 = saturate( lerpResult83_g43125 );
				
				surfaceDescription.Normal = lerpResult410_g43147;
				surfaceDescription.Smoothness = ( temp_output_1556_33_g38532 * Occlusion1550_g38532 ).x;
				surfaceDescription.Alpha = break377_g38532.a;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = _AlphaCutoff;
				#endif

				#ifdef _DEPTHOFFSET_ON
				surfaceDescription.DepthOffset = 0;
				#endif

				GetSurfaceAndBuiltinData( surfaceDescription, input, V, posInput, surfaceData, builtinData );

				float4 VPASSpositionCS = float4(packedInput.vpassInterpolators0.xy, 0.0, packedInput.vpassInterpolators0.z);
				float4 VPASSpreviousPositionCS = float4(packedInput.vpassInterpolators1.xy, 0.0, packedInput.vpassInterpolators1.z);

				#ifdef _DEPTHOFFSET_ON
				VPASSpositionCS.w += builtinData.depthOffset;
				VPASSpreviousPositionCS.w += builtinData.depthOffset;
				#endif

				float2 motionVector = CalculateMotionVector( VPASSpositionCS, VPASSpreviousPositionCS );
				EncodeMotionVector( motionVector * 0.5, outMotionVector );

				bool forceNoMotion = unity_MotionVectorsParams.y == 0.0;
				if( forceNoMotion )
					outMotionVector = float4( 2.0, 0.0, 0.0, 0.0 );

				#ifdef WRITE_NORMAL_BUFFER
				EncodeIntoNormalBuffer( ConvertSurfaceDataToNormalData( surfaceData ), posInput.positionSS, outNormalBuffer );

				#ifdef WRITE_MSAA_DEPTH
				depthColor = packedInput.vmeshPositionCS.z;
				#endif
				#elif defined(WRITE_MSAA_DEPTH)
				//outNormalBuffer = float4( 0.0, 0.0, 0.0, 1.0 );
				depthColor = packedInput.vmeshPositionCS.z;
				#endif

				#ifdef _DEPTHOFFSET_ON
				outputDepth = posInput.deviceDepth;
				#endif
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "Forward"
			Tags { "LightMode"="Forward" }

			Blend [_SrcBlend] [_DstBlend], [_AlphaSrcBlend] [_AlphaDstBlend]
			Cull [_CullModeForward]
			ZTest [_ZTestDepthEqualForOpaque]
			ZWrite [_ZWrite]

			Stencil
			{
				Ref [_StencilRef]
				WriteMask [_StencilWriteMask]
				Comp Always
				Pass Replace
				Fail Keep
				ZFail Keep
			}


			ColorMask [_ColorMaskTransparentVel] 1

			HLSLPROGRAM

			#define _ALPHATEST_SHADOW_ON 1
			#define _ENABLE_GEOMETRIC_SPECULAR_AA 1
			#define _SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL 1
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_BENT_NORMAL 1
			#define _AMBIENT_OCCLUSION 1
			#define HAVE_MESH_MODIFICATION
			#define ASE_SRP_VERSION 100400
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local _DOUBLESIDED_ON
			#pragma shader_feature_local _ _BLENDMODE_ALPHA _BLENDMODE_ADD _BLENDMODE_PRE_MULTIPLY
			#pragma shader_feature_local _ENABLE_FOG_ON_TRANSPARENT
			#pragma shader_feature_local _ALPHATEST_ON

			#if !defined(DEBUG_DISPLAY) && defined(_ALPHATEST_ON)
			#define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
			#endif

			#define SHADERPASS SHADERPASS_FORWARD
			#pragma multi_compile _ DEBUG_DISPLAY
			#pragma multi_compile _ LIGHTMAP_ON
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ DYNAMICLIGHTMAP_ON
			#pragma multi_compile _ SHADOWS_SHADOWMASK
			#pragma multi_compile DECALS_OFF DECALS_3RT DECALS_4RT
			#pragma multi_compile USE_FPTL_LIGHTLIST USE_CLUSTERED_LIGHTLIST
			#pragma multi_compile SHADOW_LOW SHADOW_MEDIUM SHADOW_HIGH

			#pragma vertex Vert
			#pragma fragment Frag

			//#define UNITY_MATERIAL_LIT

			#if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
			#endif

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#ifdef DEBUG_DISPLAY
				#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
			#endif

			// CBuffer must be declared before Material.hlsl since it internaly uses _BlendMode now
			CBUFFER_START( UnityPerMaterial )
			float4 _Smoothness;
			half4 _ColorDetail;
			float4 _Color;
			float _SmoothnessMax;
			half _DetailOffsetXDetailMask;
			half _DetailOffsetYDetailMask;
			half _Detail_BlendAmountMask;
			half _Detail_BlendHardnessMask;
			half _Detail_BlendFalloffMask;
			half _DetailBlendInfluence;
			int _BlendColor;
			half _BlendHeight;
			half _DetailBlendSmooth;
			float _EnableDetailMap;
			half _NormalStrength;
			half _DetailNormalMapScale;
			int _NormalMapSpace;
			half _NormalStrengthBent;
			float _MetallicStrength;
			int _SmoothnessSource;
			float _OcclusionStrengthAO;
			float _OcclusionSource;
			float _AlphaCutoffShadow;
			float _SpecularAAScreenSpaceVariance;
			float _DetailTilingYDetailMask;
			float _DetailTilingXDetailMask;
			half _DetailOffsetXDetail;
			float _EnableGeometricSpecularAA;
			float _SmoothnessMin;
			float _DoubleSidedGIMode;
			half _EmissionFlags;
			float _TransparentWritingMotionVec;
			float _EnableBlendModePreserveSpecularLighting;
			float _AlphaToMaskInspectorValue;
			int _OpaqueCullMode;
			int _WindMode;
			float _GlobalWindInfluenceOther;
			float _LocalWindStrength;
			float _LocalRandomWindOffset;
			float _LocalWindPulse;
			float _LocalWindDirection;
			float _TilingX;
			float _TilingY;
			float _OffsetX;
			float _OffsetY;
			half _Brightness;
			int _EnableDetailMask;
			float _DetailTilingXDetail;
			float _DetailTilingYDetail;
			half _DetailOffsetYDetail;
			float _SpecularAAThreshold;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			int _Global_Wind_Main_Fade_Enabled;
			float _Global_Wind_Main_Intensity;
			float _Global_Wind_Main_RandomOffset;
			float _Global_Wind_Main_Pulse;
			float _Global_Wind_Main_Direction;
			float _Global_Wind_Main_Fade_Bias;
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_trilinear_repeat);
			TEXTURE2D(_DetailAlbedoMap);
			TEXTURE2D(_DetailMaskMap);
			TEXTURE2D(_BumpMap);
			TEXTURE2D(_DetailNormalMap);
			TEXTURE2D(_BentNormalMap);
			TEXTURE2D(_MetallicGlossMap);
			TEXTURE2D(_SmoothnessMap);
			TEXTURE2D(_OcclusionMap);


			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/Lighting.hlsl"
			#define HAS_LIGHTLOOP
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/LightLoop/LightLoopDef.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/LightLoop/LightLoop.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_FRAG_COLOR
			#pragma instancing_options procedural:SetupNatureRenderer forwardadd
			#pragma multi_compile GPU_FRUSTUM_ON __
			#include "Nature Renderer.cginc"
			#pragma multi_compile_local _ NATURE_RENDERER
			#pragma shader_feature_local _ALPHATOMASK_ON
			#pragma shader_feature_local _ _VERTEX_DISPLACEMENT _PIXEL_DISPLACEMENT
			#pragma shader_feature_local_vertex _VERTEX_DISPLACEMENT_LOCK_OBJECT_SCALE
			#pragma shader_feature_local _DISPLACEMENT_LOCK_TILING_SCALE
			#pragma shader_feature_local_fragment _PIXEL_DISPLACEMENT_LOCK_OBJECT_SCALE


			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
				#define ASE_NEED_CULLFACE 1
			#endif

			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
					float3 previousPositionOS : TEXCOORD4;
					#if defined (_ADD_PRECOMPUTED_VELOCITY)
						float3 precomputedVelocity : TEXCOORD5;
					#endif
				#endif
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				float4 positionCS : SV_Position;
				float3 interp00 : TEXCOORD0;
				float3 interp01 : TEXCOORD1;
				float4 interp02 : TEXCOORD2;
				float4 interp03 : TEXCOORD3;
				float4 interp04 : TEXCOORD4;
				#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
					float3 vpassPositionCS : TEXCOORD5;
					float3 vpassPreviousPositionCS : TEXCOORD6;
				#endif
				float4 ase_texcoord7 : TEXCOORD7;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};

			float Wind_Globalfloatswitch( int m_switch, float m_Off, float m_Global, float m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float(0);
			}
			
			float2 DirectionalEquation( float _WindDirection )
			{
				float d = _WindDirection * 0.0174532924;
				float xL = cos(d) + 1 / 2;
				float zL = sin(d) + 1 / 2;
				return float2(zL,xL);
			}
			
			float3 Wind_Globalfloat3switch( int m_switch, float3 m_Off, float3 m_Global, float3 m_Local )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Global;
				else if(m_switch ==2)
					return m_Local;
				else
				return float3(0,0,0);
			}
			
			float3 Wind_Fadefloat3switch3050_g3455( int m_switch, float3 m_Off, float3 m_ActiveFadeOut, float3 m_ActiveFadeIn )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_ActiveFadeOut;
				else if(m_switch ==2)
					return m_ActiveFadeIn;
				else
				return float3(0,0,0);
			}
			
			float4 Detail_Maskfloat4switch226_g43147( int m_switch, float4 m_Off, float4 m_Active, float4 m_ActiveInverted )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else if(m_switch ==2)
					return m_ActiveInverted;
				else
				return float4(0,0,0,0);
			}
			
			float Detail_BlendVCfloatswitch319_g43147( int m_switch, float m_Red, float m_Green, float m_Blue )
			{
				if(m_switch ==0)
					return m_Red;
				else if(m_switch ==1)
					return m_Green;
				else if(m_switch ==2)
					return m_Blue;
				else
				return float(0);
			}
			
			float3 Detail_Maskfloat3switch221_g43147( int m_switch, float3 m_Off, float3 m_Active, float3 m_ActiveInverted )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else if(m_switch ==2)
					return m_ActiveInverted;
				else
				return float3(0,0,0);
			}
			
			float3 ASEUnpackNormalRGB(float4 PackedNormal, float Scale = 1.0 )
			{
				float3 normal;
				normal.xyz = PackedNormal.rgb * 2.0 - 1.0;
				normal.xy *= Scale;
				return normal;
			}
			
			float3 _BentNormal_Spacefloat3switch6_g43151( int m_switch, float3 m_TangentSpace, float3 m_ObjectSpace )
			{
				if(m_switch ==0)
					return m_TangentSpace;
				else if(m_switch ==1)
					return m_ObjectSpace;
				else
				return float3(0,0,0);
			}
			
			float4 SmoothnessTypefloat4switch215_g43132( int m_switch, float4 m_Smoothness, float4 m_Roughness, float4 m_Geometric )
			{
				if(m_switch ==0)
					return m_Smoothness;
				else if(m_switch ==1)
					return m_Roughness;
				else if(m_switch ==2)
					return m_Geometric;
				else
				return float4(0,0,0,0);
			}
			

			void BuildSurfaceData(FragInputs fragInputs, inout GlobalSurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.specularOcclusion = 1.0;

				// surface data
				surfaceData.baseColor =					surfaceDescription.Albedo;
				surfaceData.perceptualSmoothness =		surfaceDescription.Smoothness;
				surfaceData.ambientOcclusion =			surfaceDescription.Occlusion;
				surfaceData.metallic =					surfaceDescription.Metallic;
				surfaceData.coatMask =					surfaceDescription.CoatMask;

				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceData.specularOcclusion =			surfaceDescription.SpecularOcclusion;
				#endif
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.subsurfaceMask =			surfaceDescription.SubsurfaceMask;
				#endif
				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceData.thickness =					surfaceDescription.Thickness;
				#endif
				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
				surfaceData.diffusionProfileHash =		asuint(surfaceDescription.DiffusionProfile);
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.specularColor =				surfaceDescription.Specular;
				#endif
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.anisotropy =				surfaceDescription.Anisotropy;
				#endif
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.iridescenceMask =			surfaceDescription.IridescenceMask;
				surfaceData.iridescenceThickness =		surfaceDescription.IridescenceThickness;
				#endif

				// refraction
				#ifdef _HAS_REFRACTION
				if( _EnableSSRefraction )
				{
					surfaceData.ior = surfaceDescription.RefractionIndex;
					surfaceData.transmittanceColor = surfaceDescription.RefractionColor;
					surfaceData.atDistance = surfaceDescription.RefractionDistance;

					surfaceData.transmittanceMask = ( 1.0 - surfaceDescription.Alpha );
					surfaceDescription.Alpha = 1.0;
				}
				else
				{
					surfaceData.ior = 1.0;
					surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
					surfaceData.atDistance = 1.0;
					surfaceData.transmittanceMask = 0.0;
					surfaceDescription.Alpha = 1.0;
				}
				#else
				surfaceData.ior = 1.0;
				surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
				surfaceData.atDistance = 1.0;
				surfaceData.transmittanceMask = 0.0;
				#endif


				// material features
				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
				#endif
				#ifdef ASE_LIT_CLEAR_COAT
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				// others
				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
				surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif
				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				// normals
				float3 normalTS = float3(0.0f, 0.0f, 1.0f);
				normalTS = surfaceDescription.Normal;
				GetNormalWS( fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants );

				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
				surfaceData.tangentWS = normalize( fragInputs.tangentToWorld[ 0 ].xyz );

				// decals
				#if HAVE_DECALS
				if( _EnableDecals )
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs.tangentToWorld[2], surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
				#endif

				bentNormalWS = surfaceData.normalWS;
				
				#ifdef ASE_BENT_NORMAL
				GetNormalWS( fragInputs, surfaceDescription.BentNormal, bentNormalWS, doubleSidedConstants );
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.tangentWS = TransformTangentToWorld( surfaceDescription.Tangent, fragInputs.tangentToWorld );
				#endif
				surfaceData.tangentWS = Orthonormalize( surfaceData.tangentWS, surfaceData.normalWS );


				#if defined(_SPECULAR_OCCLUSION_CUSTOM)
				#elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO( V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness( surfaceData.perceptualSmoothness ) );
				#elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion( ClampNdotV( dot( surfaceData.normalWS, V ) ), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness( surfaceData.perceptualSmoothness ) );
				#endif

				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
				surfaceData.perceptualSmoothness = GeometricNormalFiltering( surfaceData.perceptualSmoothness, fragInputs.tangentToWorld[ 2 ], surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold );
				#endif

				// debug
				#if defined(DEBUG_DISPLAY)
				if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				{
					surfaceData.metallic = 0;
				}
				ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
				#endif
			}

			void GetSurfaceAndBuiltinData(GlobalSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
				LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				ApplyDoubleSidedFlipOrMirror( fragInputs, doubleSidedConstants );

				#ifdef _ALPHATEST_ON
				DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#ifdef _DEPTHOFFSET_ON
				builtinData.depthOffset = surfaceDescription.DepthOffset;
				ApplyDepthOffsetPositionInput( V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput );
				#endif

				float3 bentNormalWS;
				BuildSurfaceData( fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS );

				InitBuiltinData( posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[ 2 ], fragInputs.texCoord1, fragInputs.texCoord2, builtinData );

				#ifdef _ASE_BAKEDGI
				builtinData.bakeDiffuseLighting = surfaceDescription.BakedGI;
				#endif
				#ifdef _ASE_BAKEDBACKGI
				builtinData.backBakeDiffuseLighting = surfaceDescription.BakedBackGI;
				#endif

				builtinData.emissiveColor = surfaceDescription.Emission;

				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			AttributesMesh ApplyMeshModification(AttributesMesh inputMesh, float3 timeParameters, inout PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS )
			{
				_TimeParameters.xyz = timeParameters;
				int m_switch3050_g3455 = _Global_Wind_Main_Fade_Enabled;
				int m_switch2453_g3455 = _WindMode;
				float3 m_Off2453_g3455 = float3(0,0,0);
				float3 VERTEX_POSITION_MATRIX2352_g3455 = mul( GetObjectToWorldMatrix(), float4( inputMesh.positionOS , 0.0 ) ).xyz;
				float3 break2265_g3455 = VERTEX_POSITION_MATRIX2352_g3455;
				int WIND_MODE2462_g3455 = _WindMode;
				int m_switch2458_g3455 = WIND_MODE2462_g3455;
				float m_Off2458_g3455 = 1.0;
				float m_Global2458_g3455 = ( _GlobalWindInfluenceOther * _Global_Wind_Main_Intensity );
				float m_Local2458_g3455 = _LocalWindStrength;
				float localWind_Globalfloatswitch2458_g3455 = Wind_Globalfloatswitch( m_switch2458_g3455 , m_Off2458_g3455 , m_Global2458_g3455 , m_Local2458_g3455 );
				float _WIND_STRENGHT2400_g3455 = localWind_Globalfloatswitch2458_g3455;
				int m_switch2468_g3455 = WIND_MODE2462_g3455;
				float m_Off2468_g3455 = 1.0;
				float m_Global2468_g3455 = _Global_Wind_Main_RandomOffset;
				float m_Local2468_g3455 = _LocalRandomWindOffset;
				float localWind_Globalfloatswitch2468_g3455 = Wind_Globalfloatswitch( m_switch2468_g3455 , m_Off2468_g3455 , m_Global2468_g3455 , m_Local2468_g3455 );
				float4 transform3073_g3455 = mul(GetObjectToWorldMatrix(),float4( 0,0,0,1 ));
				transform3073_g3455.xyz = GetAbsolutePositionWS((transform3073_g3455).xyz);
				float2 appendResult2307_g3455 = (float2(transform3073_g3455.x , transform3073_g3455.z));
				float dotResult2341_g3455 = dot( appendResult2307_g3455 , float2( 12.9898,78.233 ) );
				float lerpResult2238_g3455 = lerp( 0.8 , ( ( localWind_Globalfloatswitch2468_g3455 / 2.0 ) + 0.9 ) , frac( ( sin( dotResult2341_g3455 ) * 43758.55 ) ));
				float _WIND_RANDOM_OFFSET2244_g3455 = ( ( _TimeParameters.x * 0.05 ) * lerpResult2238_g3455 );
				float _WIND_TUBULENCE_RANDOM2274_g3455 = ( sin( ( ( _WIND_RANDOM_OFFSET2244_g3455 * 40.0 ) - ( VERTEX_POSITION_MATRIX2352_g3455.z / 15.0 ) ) ) * 0.5 );
				int m_switch2312_g3455 = WIND_MODE2462_g3455;
				float m_Off2312_g3455 = 1.0;
				float m_Global2312_g3455 = _Global_Wind_Main_Pulse;
				float m_Local2312_g3455 = _LocalWindPulse;
				float localWind_Globalfloatswitch2312_g3455 = Wind_Globalfloatswitch( m_switch2312_g3455 , m_Off2312_g3455 , m_Global2312_g3455 , m_Local2312_g3455 );
				float _WIND_PULSE2421_g3455 = localWind_Globalfloatswitch2312_g3455;
				float FUNC_Angle2470_g3455 = ( _WIND_STRENGHT2400_g3455 * ( 1.0 + sin( ( ( ( ( _WIND_RANDOM_OFFSET2244_g3455 * 2.0 ) + _WIND_TUBULENCE_RANDOM2274_g3455 ) - ( VERTEX_POSITION_MATRIX2352_g3455.z / 50.0 ) ) - ( inputMesh.ase_color.r / 20.0 ) ) ) ) * sqrt( inputMesh.ase_color.r ) * _WIND_PULSE2421_g3455 );
				float FUNC_Angle_SinA2424_g3455 = sin( FUNC_Angle2470_g3455 );
				float FUNC_Angle_CosA2362_g3455 = cos( FUNC_Angle2470_g3455 );
				int m_switch2456_g3455 = WIND_MODE2462_g3455;
				float m_Off2456_g3455 = 1.0;
				float m_Global2456_g3455 = _Global_Wind_Main_Direction;
				float m_Local2456_g3455 = _LocalWindDirection;
				float localWind_Globalfloatswitch2456_g3455 = Wind_Globalfloatswitch( m_switch2456_g3455 , m_Off2456_g3455 , m_Global2456_g3455 , m_Local2456_g3455 );
				float _WindDirection2249_g3455 = localWind_Globalfloatswitch2456_g3455;
				float2 localDirectionalEquation2249_g3455 = DirectionalEquation( _WindDirection2249_g3455 );
				float2 break2469_g3455 = localDirectionalEquation2249_g3455;
				float _WIND_DIRECTION_X2418_g3455 = break2469_g3455.x;
				float lerpResult2258_g3455 = lerp( break2265_g3455.x , ( ( break2265_g3455.y * FUNC_Angle_SinA2424_g3455 ) + ( break2265_g3455.x * FUNC_Angle_CosA2362_g3455 ) ) , _WIND_DIRECTION_X2418_g3455);
				float3 break2340_g3455 = VERTEX_POSITION_MATRIX2352_g3455;
				float3 break2233_g3455 = VERTEX_POSITION_MATRIX2352_g3455;
				float _WIND_DIRECTION_Y2416_g3455 = break2469_g3455.y;
				float lerpResult2275_g3455 = lerp( break2233_g3455.z , ( ( break2233_g3455.y * FUNC_Angle_SinA2424_g3455 ) + ( break2233_g3455.z * FUNC_Angle_CosA2362_g3455 ) ) , _WIND_DIRECTION_Y2416_g3455);
				float3 appendResult2235_g3455 = (float3(lerpResult2258_g3455 , ( ( break2340_g3455.y * FUNC_Angle_CosA2362_g3455 ) - ( break2340_g3455.z * FUNC_Angle_SinA2424_g3455 ) ) , lerpResult2275_g3455));
				float3 VERTEX_POSITION2282_g3455 = ( mul( GetWorldToObjectMatrix(), float4( appendResult2235_g3455 , 0.0 ) ).xyz - inputMesh.positionOS );
				float3 m_Global2453_g3455 = VERTEX_POSITION2282_g3455;
				float3 m_Local2453_g3455 = VERTEX_POSITION2282_g3455;
				float3 localWind_Globalfloat3switch2453_g3455 = Wind_Globalfloat3switch( m_switch2453_g3455 , m_Off2453_g3455 , m_Global2453_g3455 , m_Local2453_g3455 );
				float3 m_Off3050_g3455 = localWind_Globalfloat3switch2453_g3455;
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				float temp_output_3048_0_g3455 = saturate( pow( ( distance( _WorldSpaceCameraPos , ase_worldPos ) / _Global_Wind_Main_Fade_Bias ) , 5.0 ) );
				float3 m_ActiveFadeOut3050_g3455 = ( localWind_Globalfloat3switch2453_g3455 * ( 1.0 - temp_output_3048_0_g3455 ) );
				float3 m_ActiveFadeIn3050_g3455 = ( localWind_Globalfloat3switch2453_g3455 * temp_output_3048_0_g3455 );
				float3 localWind_Fadefloat3switch3050_g3455 = Wind_Fadefloat3switch3050_g3455( m_switch3050_g3455 , m_Off3050_g3455 , m_ActiveFadeOut3050_g3455 , m_ActiveFadeIn3050_g3455 );
				float3 temp_output_309_0_g38532 = localWind_Fadefloat3switch3050_g3455;
				
				outputPackedVaryingsMeshToPS.ase_texcoord7.xy = inputMesh.ase_texcoord.xy;
				outputPackedVaryingsMeshToPS.ase_color = inputMesh.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord7.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = temp_output_309_0_g38532;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif
				inputMesh.normalOS = inputMesh.normalOS;
				inputMesh.tangentOS = inputMesh.tangentOS;
				return inputMesh;
			}

			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh)
			{
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS = (PackedVaryingsMeshToPS)0;
				AttributesMesh defaultMesh = inputMesh;

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, outputPackedVaryingsMeshToPS);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( outputPackedVaryingsMeshToPS );

				inputMesh = ApplyMeshModification( inputMesh, _TimeParameters.xyz, outputPackedVaryingsMeshToPS);

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				float3 normalWS = TransformObjectToWorldNormal(inputMesh.normalOS);
				float4 tangentWS = float4(TransformObjectToWorldDir(inputMesh.tangentOS.xyz), inputMesh.tangentOS.w);

				#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
				float4 VPASSpreviousPositionCS;
				float4 VPASSpositionCS = mul(UNITY_MATRIX_UNJITTERED_VP, float4(positionRWS, 1.0));

				bool forceNoMotion = unity_MotionVectorsParams.y == 0.0;
				if (forceNoMotion)
				{
					VPASSpreviousPositionCS = float4(0.0, 0.0, 0.0, 1.0);
				}
				else
				{
					bool hasDeformation = unity_MotionVectorsParams.x > 0.0;
					float3 effectivePositionOS = (hasDeformation ? inputMesh.previousPositionOS : defaultMesh.positionOS);
					#if defined(_ADD_PRECOMPUTED_VELOCITY)
					effectivePositionOS -= inputMesh.precomputedVelocity;
					#endif

					#if defined(HAVE_MESH_MODIFICATION)
						AttributesMesh previousMesh = defaultMesh;
						previousMesh.positionOS = effectivePositionOS ;
						PackedVaryingsMeshToPS test = (PackedVaryingsMeshToPS)0;
						float3 curTime = _TimeParameters.xyz;
						previousMesh = ApplyMeshModification(previousMesh, _LastTimeParameters.xyz, test);
						_TimeParameters.xyz = curTime;
						float3 previousPositionRWS = TransformPreviousObjectToWorld(previousMesh.positionOS);
					#else
						float3 previousPositionRWS = TransformPreviousObjectToWorld(effectivePositionOS);
					#endif

					#ifdef ATTRIBUTES_NEED_NORMAL
						float3 normalWS = TransformPreviousObjectToWorldNormal(defaultMesh.normalOS);
					#else
						float3 normalWS = float3(0.0, 0.0, 0.0);
					#endif

					#if defined(HAVE_VERTEX_MODIFICATION)
						//ApplyVertexModification(inputMesh, normalWS, previousPositionRWS, _LastTimeParameters.xyz);
					#endif

					VPASSpreviousPositionCS = mul(UNITY_MATRIX_PREV_VP, float4(previousPositionRWS, 1.0));
				}
				#endif

				outputPackedVaryingsMeshToPS.positionCS = TransformWorldToHClip(positionRWS);
				outputPackedVaryingsMeshToPS.interp00.xyz = positionRWS;
				outputPackedVaryingsMeshToPS.interp01.xyz = normalWS;
				outputPackedVaryingsMeshToPS.interp02.xyzw = tangentWS;
				outputPackedVaryingsMeshToPS.interp03.xyzw = inputMesh.uv1;
				outputPackedVaryingsMeshToPS.interp04.xyzw = inputMesh.uv2;

				#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
					outputPackedVaryingsMeshToPS.vpassPositionCS = float3(VPASSpositionCS.xyw);
					outputPackedVaryingsMeshToPS.vpassPreviousPositionCS = float3(VPASSpreviousPositionCS.xyw);
				#endif
				return outputPackedVaryingsMeshToPS;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
					float3 previousPositionOS : TEXCOORD4;
					#if defined (_ADD_PRECOMPUTED_VELOCITY)
						float3 precomputedVelocity : TEXCOORD5;
					#endif
				#endif
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				o.uv1 = v.uv1;
				o.uv2 = v.uv2;
				#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
					o.previousPositionOS = v.previousPositionOS;
					#if defined (_ADD_PRECOMPUTED_VELOCITY)
						o.precomputedVelocity = v.precomputedVelocity;
					#endif
				#endif
				o.ase_color = v.ase_color;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.uv1 = patch[0].uv1 * bary.x + patch[1].uv1 * bary.y + patch[2].uv1 * bary.z;
				o.uv2 = patch[0].uv2 * bary.x + patch[1].uv2 * bary.y + patch[2].uv2 * bary.z;
				#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
					o.previousPositionOS = patch[0].previousPositionOS * bary.x + patch[1].previousPositionOS * bary.y + patch[2].previousPositionOS * bary.z;
					#if defined (_ADD_PRECOMPUTED_VELOCITY)
						o.precomputedVelocity = patch[0].precomputedVelocity * bary.x + patch[1].precomputedVelocity * bary.y + patch[2].precomputedVelocity * bary.z;
					#endif
				#endif
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif

			void Frag(PackedVaryingsMeshToPS packedInput,
					#ifdef OUTPUT_SPLIT_LIGHTING
						out float4 outColor : SV_Target0,
						out float4 outDiffuseLighting : SV_Target1,
						OUTPUT_SSSBUFFER(outSSSBuffer)
					#else
						out float4 outColor : SV_Target0
					#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
						, out float4 outMotionVec : SV_Target1
					#endif
					#endif
					#ifdef _DEPTHOFFSET_ON
						, out float outputDepth : SV_Depth
					#endif
					
						)
			{
				#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
					outMotionVec = float4(2.0, 0.0, 0.0, 0.0);
				#endif

				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				UNITY_SETUP_INSTANCE_ID( packedInput );
				float3 positionRWS = packedInput.interp00.xyz;
				float3 normalWS = packedInput.interp01.xyz;
				float4 tangentWS = packedInput.interp02.xyzw;

				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.positionCS;
				input.positionRWS = positionRWS;
				input.tangentToWorld = BuildTangentToWorld(tangentWS, normalWS);
				input.texCoord1 = packedInput.interp03.xyzw;
				input.texCoord2 = packedInput.interp04.xyzw;

				#if _DOUBLESIDED_ON && SHADER_STAGE_FRAGMENT
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false);
				#elif SHADER_STAGE_FRAGMENT
				#if defined(ASE_NEED_CULLFACE)
				input.isFrontFace = IS_FRONT_VFACE(packedInput.cullFace, true, false);
				#endif
				#endif
				half isFrontFace = input.isFrontFace;

				input.positionSS.xy = _OffScreenRendering > 0 ? (input.positionSS.xy * _OffScreenDownsampleFactor) : input.positionSS.xy;
				uint2 tileIndex = uint2(input.positionSS.xy) / GetTileSize ();

				PositionInputs posInput = GetPositionInput( input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS.xyz, tileIndex );

				float3 V = GetWorldSpaceNormalizeViewDir(input.positionRWS);

				GlobalSurfaceDescription surfaceDescription = (GlobalSurfaceDescription)0;
				float2 appendResult150_g38532 = (float2(_TilingX , _TilingY));
				float2 appendResult151_g38532 = (float2(_OffsetX , _OffsetY));
				float2 texCoord2_g43136 = packedInput.ase_texcoord7.xy * appendResult150_g38532 + appendResult151_g38532;
				float2 OUT_UV431_g38532 = texCoord2_g43136;
				float2 UV40_g43133 = OUT_UV431_g38532;
				float4 tex2DNode63_g43133 = SAMPLE_TEXTURE2D( _MainTex, sampler_trilinear_repeat, UV40_g43133 );
				float4 OUT_ALBEDO_RGBA1177_g38532 = tex2DNode63_g43133;
				float3 temp_output_7_0_g38532 = ( (_Color).rgb * (OUT_ALBEDO_RGBA1177_g38532).rgb * _Brightness );
				float4 temp_output_39_0_g43147 = ( float4( temp_output_7_0_g38532 , 0.0 ) + float4(0,0,0,0) );
				float4 Albedo_RGBA40_g43147 = temp_output_39_0_g43147;
				int m_switch226_g43147 = _EnableDetailMask;
				float2 appendResult132_g43147 = (float2(_DetailTilingXDetail , _DetailTilingYDetail));
				float2 appendResult114_g43147 = (float2(_DetailOffsetXDetail , _DetailOffsetYDetail));
				float2 texCoord67_g43147 = packedInput.ase_texcoord7.xy * appendResult132_g43147 + appendResult114_g43147;
				float4 tex2DNode45_g43147 = SAMPLE_TEXTURE2D( _DetailAlbedoMap, sampler_trilinear_repeat, texCoord67_g43147 );
				float4 ALBEDO_OUT255_g43147 = ( _ColorDetail * tex2DNode45_g43147 * _Brightness );
				float4 m_Off226_g43147 = ALBEDO_OUT255_g43147;
				float2 appendResult219_g43147 = (float2(_DetailTilingXDetailMask , _DetailTilingYDetailMask));
				float2 appendResult206_g43147 = (float2(_DetailOffsetXDetailMask , _DetailOffsetYDetailMask));
				float2 texCoord220_g43147 = packedInput.ase_texcoord7.xy * appendResult219_g43147 + appendResult206_g43147;
				float temp_output_15_0_g43150 = ( 1.0 - SAMPLE_TEXTURE2D( _DetailMaskMap, sampler_trilinear_repeat, texCoord220_g43147 ).r );
				float temp_output_26_0_g43150 = _Detail_BlendAmountMask;
				float temp_output_24_0_g43150 = _Detail_BlendHardnessMask;
				float saferPower2_g43150 = abs( max( saturate( (0.0 + (temp_output_15_0_g43150 - ( 1.0 - temp_output_26_0_g43150 )) * (temp_output_24_0_g43150 - 0.0) / (1.0 - ( 1.0 - temp_output_26_0_g43150 ))) ) , 0.0 ) );
				float temp_output_22_0_g43150 = _Detail_BlendFalloffMask;
				float temp_output_403_0_g43147 = saturate( pow( saferPower2_g43150 , ( 1.0 - temp_output_22_0_g43150 ) ) );
				float4 lerpResult225_g43147 = lerp( Albedo_RGBA40_g43147 , ALBEDO_OUT255_g43147 , temp_output_403_0_g43147);
				float4 m_Active226_g43147 = lerpResult225_g43147;
				float saferPower11_g43150 = abs( max( saturate( (1.0 + (temp_output_15_0_g43150 - temp_output_26_0_g43150) * (( 1.0 - temp_output_24_0_g43150 ) - 1.0) / (0.0 - temp_output_26_0_g43150)) ) , 0.0 ) );
				float temp_output_403_21_g43147 = saturate( pow( saferPower11_g43150 , temp_output_22_0_g43150 ) );
				float4 lerpResult408_g43147 = lerp( ALBEDO_OUT255_g43147 , Albedo_RGBA40_g43147 , temp_output_403_21_g43147);
				float4 m_ActiveInverted226_g43147 = lerpResult408_g43147;
				float4 localDetail_Maskfloat4switch226_g43147 = Detail_Maskfloat4switch226_g43147( m_switch226_g43147 , m_Off226_g43147 , m_Active226_g43147 , m_ActiveInverted226_g43147 );
				float4 Mask_Albedo258_g43147 = localDetail_Maskfloat4switch226_g43147;
				float4 break48_g43147 = temp_output_39_0_g43147;
				float Albedo_RGB300_g43147 = ( break48_g43147.x + break48_g43147.y + break48_g43147.z );
				int m_switch319_g43147 = _BlendColor;
				float m_Red319_g43147 = packedInput.ase_color.r;
				float m_Green319_g43147 = packedInput.ase_color.g;
				float m_Blue319_g43147 = packedInput.ase_color.b;
				float localDetail_BlendVCfloatswitch319_g43147 = Detail_BlendVCfloatswitch319_g43147( m_switch319_g43147 , m_Red319_g43147 , m_Green319_g43147 , m_Blue319_g43147 );
				float clampResult47_g43147 = clamp( ( ( ( ( Albedo_RGB300_g43147 - 0.5 ) * ( _DetailBlendInfluence - 0.9 ) ) + ( localDetail_BlendVCfloatswitch319_g43147 - ( _BlendHeight - 0.4 ) ) ) / _DetailBlendSmooth ) , 0.0 , 1.0 );
				float DetailBlend43_g43147 = clampResult47_g43147;
				float4 lerpResult58_g43147 = lerp( Mask_Albedo258_g43147 , Albedo_RGBA40_g43147 , DetailBlend43_g43147);
				float4 lerpResult409_g43147 = lerp( Albedo_RGBA40_g43147 , lerpResult58_g43147 , _EnableDetailMap);
				
				float4 OUT_NORMAL1178_g38532 = SAMPLE_TEXTURE2D( _BumpMap, sampler_trilinear_repeat, UV40_g43133 );
				float4 temp_output_1_0_g43120 = OUT_NORMAL1178_g38532;
				float temp_output_8_0_g43120 = _NormalStrength;
				float3 unpack52_g43120 = UnpackNormalScale( temp_output_1_0_g43120, temp_output_8_0_g43120 );
				unpack52_g43120.z = lerp( 1, unpack52_g43120.z, saturate(temp_output_8_0_g43120) );
				float3 temp_output_1478_59_g38532 = unpack52_g43120;
				float3 temp_output_38_0_g43147 = temp_output_1478_59_g38532;
				float3 Normal_XYZ260_g43147 = temp_output_38_0_g43147;
				int EnableDetailMask216_g43147 = _EnableDetailMask;
				int m_switch221_g43147 = EnableDetailMask216_g43147;
				float4 temp_output_1_0_g43148 = SAMPLE_TEXTURE2D( _DetailNormalMap, sampler_trilinear_repeat, texCoord67_g43147 );
				float temp_output_8_0_g43148 = _DetailNormalMapScale;
				float3 unpack52_g43148 = UnpackNormalScale( temp_output_1_0_g43148, temp_output_8_0_g43148 );
				unpack52_g43148.z = lerp( 1, unpack52_g43148.z, saturate(temp_output_8_0_g43148) );
				float3 Detail_Normal199_g43147 = unpack52_g43148;
				float3 m_Off221_g43147 = Detail_Normal199_g43147;
				float3 lerpResult205_g43147 = lerp( Normal_XYZ260_g43147 , Detail_Normal199_g43147 , temp_output_403_0_g43147);
				float3 m_Active221_g43147 = saturate( lerpResult205_g43147 );
				float3 lerpResult406_g43147 = lerp( Detail_Normal199_g43147 , Normal_XYZ260_g43147 , temp_output_403_21_g43147);
				float3 m_ActiveInverted221_g43147 = saturate( lerpResult406_g43147 );
				float3 localDetail_Maskfloat3switch221_g43147 = Detail_Maskfloat3switch221_g43147( m_switch221_g43147 , m_Off221_g43147 , m_Active221_g43147 , m_ActiveInverted221_g43147 );
				float3 Mask_Normal222_g43147 = localDetail_Maskfloat3switch221_g43147;
				float layeredBlendVar413_g43147 = DetailBlend43_g43147;
				float3 layeredBlend413_g43147 = ( lerp( Mask_Normal222_g43147,Normal_XYZ260_g43147 , layeredBlendVar413_g43147 ) );
				float3 normalizeResult414_g43147 = normalize( layeredBlend413_g43147 );
				float3 temp_output_416_0_g43147 = BlendNormal( normalizeResult414_g43147 , Normal_XYZ260_g43147 );
				float EnebleMode122_g43147 = _EnableDetailMap;
				float3 lerpResult410_g43147 = lerp( Normal_XYZ260_g43147 , temp_output_416_0_g43147 , EnebleMode122_g43147);
				
				int m_switch6_g43151 = _NormalMapSpace;
				float2 texCoord16_g43151 = packedInput.ase_texcoord7.xy * float2( 1,1 ) + float2( 0,0 );
				float4 temp_output_1_0_g43153 = SAMPLE_TEXTURE2D( _BentNormalMap, sampler_trilinear_repeat, texCoord16_g43151 );
				float temp_output_8_0_g43153 = _NormalStrengthBent;
				float3 unpack52_g43153 = UnpackNormalScale( temp_output_1_0_g43153, temp_output_8_0_g43153 );
				unpack52_g43153.z = lerp( 1, unpack52_g43153.z, saturate(temp_output_8_0_g43153) );
				float3 m_TangentSpace6_g43151 = unpack52_g43153;
				float temp_output_74_0_g43153 = ( 1.0 - temp_output_8_0_g43153 );
				float3 m_ObjectSpace6_g43151 = ASEUnpackNormalRGB(temp_output_1_0_g43153,temp_output_74_0_g43153);
				float3 local_BentNormal_Spacefloat3switch6_g43151 = _BentNormal_Spacefloat3switch6_g43151( m_switch6_g43151 , m_TangentSpace6_g43151 , m_ObjectSpace6_g43151 );
				
				float4 _MASK_B1440_g38532 = SAMPLE_TEXTURE2D( _MetallicGlossMap, sampler_trilinear_repeat, UV40_g43133 );
				float temp_output_1_0_g43124 = _MetallicStrength;
				
				int temp_output_223_0_g43132 = _SmoothnessSource;
				int m_switch215_g43132 = temp_output_223_0_g43132;
				float4 _MASK_G1438_g38532 = SAMPLE_TEXTURE2D( _SmoothnessMap, sampler_trilinear_repeat, UV40_g43133 );
				float4 temp_cast_11 = (_SmoothnessMin).xxxx;
				float4 temp_cast_12 = (_SmoothnessMax).xxxx;
				float4 temp_output_216_0_g43132 = (temp_cast_11 + (_MASK_G1438_g38532 - float4( 0,0,0,0 )) * (temp_cast_12 - temp_cast_11) / (float4( 1,1,1,1 ) - float4( 0,0,0,0 )));
				float4 m_Smoothness215_g43132 = temp_output_216_0_g43132;
				float4 temp_cast_13 = (_SmoothnessMin).xxxx;
				float4 temp_cast_14 = (_SmoothnessMax).xxxx;
				float4 temp_output_214_0_g43132 = ( 1.0 - temp_output_216_0_g43132 );
				float4 m_Roughness215_g43132 = temp_output_214_0_g43132;
				float4 temp_cast_15 = (_SmoothnessMin).xxxx;
				float4 temp_cast_16 = (_SmoothnessMax).xxxx;
				float3 NORMAL_WORLD_OUT164_g38532 = temp_output_1478_59_g38532;
				float3 temp_output_4_0_g43132 = NORMAL_WORLD_OUT164_g38532;
				float3 temp_output_178_0_g43132 = ddx( temp_output_4_0_g43132 );
				float dotResult195_g43132 = dot( temp_output_178_0_g43132 , temp_output_178_0_g43132 );
				float3 temp_output_175_0_g43132 = ddy( temp_output_4_0_g43132 );
				float dotResult201_g43132 = dot( temp_output_175_0_g43132 , temp_output_175_0_g43132 );
				float4 break377_g38532 = OUT_ALBEDO_RGBA1177_g38532;
				float ALBEDO_R169_g38532 = break377_g38532.r;
				float4 temp_cast_17 = (ALBEDO_R169_g38532).xxxx;
				float4 m_Geometric215_g43132 = ( sqrt( saturate( ( temp_output_216_0_g43132 + ( ( dotResult195_g43132 + dotResult201_g43132 ) * 2.0 ) ) ) ) * ( 1.0 - temp_cast_17 ) );
				float4 localSmoothnessTypefloat4switch215_g43132 = SmoothnessTypefloat4switch215_g43132( m_switch215_g43132 , m_Smoothness215_g43132 , m_Roughness215_g43132 , m_Geometric215_g43132 );
				float4 temp_output_1556_33_g38532 = localSmoothnessTypefloat4switch215_g43132;
				float4 PBR_Occlusion1641_g38532 = SAMPLE_TEXTURE2D( _OcclusionMap, sampler_trilinear_repeat, UV40_g43133 );
				float temp_output_16_0_g43125 = _OcclusionStrengthAO;
				float temp_output_65_0_g43125 = ( 1.0 - temp_output_16_0_g43125 );
				float3 appendResult69_g43125 = (float3(temp_output_65_0_g43125 , temp_output_65_0_g43125 , temp_output_65_0_g43125));
				float4 color77_g43125 = IsGammaSpace() ? float4(1,1,1,1) : float4(1,1,1,1);
				float4 temp_cast_20 = (packedInput.ase_color.a).xxxx;
				float4 lerpResult75_g43125 = lerp( color77_g43125 , temp_cast_20 , temp_output_16_0_g43125);
				float4 lerpResult83_g43125 = lerp( float4( ( ( ( (PBR_Occlusion1641_g38532).xyz - float3( 0.5,0.5,0.5 ) ) * temp_output_16_0_g43125 ) + appendResult69_g43125 ) , 0.0 ) , lerpResult75_g43125 , _OcclusionSource);
				float4 Occlusion1550_g38532 = saturate( lerpResult83_g43125 );
				
				float lerpResult3_g43155 = lerp( 0.0 , _SpecularAAScreenSpaceVariance , _EnableGeometricSpecularAA);
				
				float lerpResult4_g43155 = lerp( 0.0 , _SpecularAAThreshold , _EnableGeometricSpecularAA);
				
				surfaceDescription.Albedo = lerpResult409_g43147.xyz;
				surfaceDescription.Normal = lerpResult410_g43147;
				surfaceDescription.BentNormal = local_BentNormal_Spacefloat3switch6_g43151;
				surfaceDescription.CoatMask = 0;
				surfaceDescription.Metallic = ( _MASK_B1440_g38532.r * temp_output_1_0_g43124 );

				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceDescription.Specular = 0;
				#endif

				surfaceDescription.Emission = 0;
				surfaceDescription.Smoothness = ( temp_output_1556_33_g38532 * Occlusion1550_g38532 ).x;
				surfaceDescription.Occlusion = saturate( lerpResult83_g43125 ).r;
				surfaceDescription.Alpha = break377_g38532.a;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = _AlphaCutoff;
				#endif

				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
				surfaceDescription.SpecularAAScreenSpaceVariance = lerpResult3_g43155;
				surfaceDescription.SpecularAAThreshold = lerpResult4_g43155;
				#endif

				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceDescription.SpecularOcclusion = 0;
				#endif

				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceDescription.Thickness = 1;
				#endif

				#ifdef _HAS_REFRACTION
				surfaceDescription.RefractionIndex = 1;
				surfaceDescription.RefractionColor = float3( 1, 1, 1 );
				surfaceDescription.RefractionDistance = 0;
				#endif

				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceDescription.SubsurfaceMask = 1;
				#endif

				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
				surfaceDescription.DiffusionProfile = 0;
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceDescription.Anisotropy = 1;
				surfaceDescription.Tangent = float3( 1, 0, 0 );
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceDescription.IridescenceMask = 0;
				surfaceDescription.IridescenceThickness = 0;
				#endif

				#ifdef _ASE_BAKEDGI
				surfaceDescription.BakedGI = 0;
				#endif
				#ifdef _ASE_BAKEDBACKGI
				surfaceDescription.BakedBackGI = 0;
				#endif

				#ifdef _DEPTHOFFSET_ON
				surfaceDescription.DepthOffset = 0;
				#endif

				SurfaceData surfaceData;
				BuiltinData builtinData;
				GetSurfaceAndBuiltinData(surfaceDescription,input, V, posInput, surfaceData, builtinData);

				BSDFData bsdfData = ConvertSurfaceDataToBSDFData(input.positionSS.xy, surfaceData);

				PreLightData preLightData = GetPreLightData(V, posInput, bsdfData);

				outColor = float4(0.0, 0.0, 0.0, 0.0);
				#ifdef DEBUG_DISPLAY
				#ifdef OUTPUT_SPLIT_LIGHTING
					outDiffuseLighting = 0;
					ENCODE_INTO_SSSBUFFER(surfaceData, posInput.positionSS, outSSSBuffer);
				#endif

				bool viewMaterial = false;
				int bufferSize = _DebugViewMaterialArray[0].x;
				if (bufferSize != 0)
				{
					bool needLinearToSRGB = false;
					float3 result = float3(1.0, 0.0, 1.0);

					for (int index = 1; index <= bufferSize; index++)
					{
						int indexMaterialProperty = _DebugViewMaterialArray[index].x;

						if (indexMaterialProperty != 0)
						{
							viewMaterial = true;

							GetPropertiesDataDebug(indexMaterialProperty, result, needLinearToSRGB);
							GetVaryingsDataDebug(indexMaterialProperty, input, result, needLinearToSRGB);
							GetBuiltinDataDebug(indexMaterialProperty, builtinData, posInput, result, needLinearToSRGB);
							GetSurfaceDataDebug(indexMaterialProperty, surfaceData, result, needLinearToSRGB);
							GetBSDFDataDebug(indexMaterialProperty, bsdfData, result, needLinearToSRGB);
						}
					}

					if (!needLinearToSRGB)
						result = SRGBToLinear(max(0, result));

					outColor = float4(result, 1.0);
				}

				if (!viewMaterial)
				{
					if (_DebugFullScreenMode == FULLSCREENDEBUGMODE_VALIDATE_DIFFUSE_COLOR || _DebugFullScreenMode == FULLSCREENDEBUGMODE_VALIDATE_SPECULAR_COLOR)
					{
						float3 result = float3(0.0, 0.0, 0.0);

						GetPBRValidatorDebug(surfaceData, result);

						outColor = float4(result, 1.0f);
					}
					else if (_DebugFullScreenMode == FULLSCREENDEBUGMODE_TRANSPARENCY_OVERDRAW)
					{
						float4 result = _DebugTransparencyOverdrawWeight * float4(TRANSPARENCY_OVERDRAW_COST, TRANSPARENCY_OVERDRAW_COST, TRANSPARENCY_OVERDRAW_COST, TRANSPARENCY_OVERDRAW_A);
						outColor = result;
					}
					else
				#endif
					{
				#ifdef _SURFACE_TYPE_TRANSPARENT
						uint featureFlags = LIGHT_FEATURE_MASK_FLAGS_TRANSPARENT;
				#else
						uint featureFlags = LIGHT_FEATURE_MASK_FLAGS_OPAQUE;
				#endif
					
						LightLoopOutput lightLoopOutput;
						LightLoop(V, posInput, preLightData, bsdfData, builtinData, featureFlags, lightLoopOutput);

						// Alias
						float3 diffuseLighting = lightLoopOutput.diffuseLighting;
						float3 specularLighting = lightLoopOutput.specularLighting;
					
						diffuseLighting *= GetCurrentExposureMultiplier();
						specularLighting *= GetCurrentExposureMultiplier();

				#ifdef OUTPUT_SPLIT_LIGHTING
						if (_EnableSubsurfaceScattering != 0 && ShouldOutputSplitLighting(bsdfData))
						{
							outColor = float4(specularLighting, 1.0);
							outDiffuseLighting = float4(TagLightingForSSS(diffuseLighting), 1.0);
						}
						else
						{
							outColor = float4(diffuseLighting + specularLighting, 1.0);
							outDiffuseLighting = 0;
						}
						ENCODE_INTO_SSSBUFFER(surfaceData, posInput.positionSS, outSSSBuffer);
				#else
						outColor = ApplyBlendMode(diffuseLighting, specularLighting, builtinData.opacity);
						outColor = EvaluateAtmosphericScattering(posInput, V, outColor);
				#endif

				#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
						float4 VPASSpositionCS = float4(packedInput.vpassPositionCS.xy, 0.0, packedInput.vpassPositionCS.z);
						float4 VPASSpreviousPositionCS = float4(packedInput.vpassPreviousPositionCS.xy, 0.0, packedInput.vpassPreviousPositionCS.z);

						bool forceNoMotion = any(unity_MotionVectorsParams.yw == 0.0);
						if (!forceNoMotion)
						{
							float2 motionVec = CalculateMotionVector(VPASSpositionCS, VPASSpreviousPositionCS);
							EncodeMotionVector(motionVec * 0.5, outMotionVec);
							outMotionVec.zw = 1.0;
						}
				#endif
					}

				#ifdef DEBUG_DISPLAY
				}
				#endif

				#ifdef _DEPTHOFFSET_ON
				outputDepth = posInput.deviceDepth;
				#endif
			}
			ENDHLSL
		}
		
	}
	
	CustomEditor "Rendering.HighDefinition.LitShaderGraphGUI"
	
	
}
/*ASEBEGIN
Version=18923
122.5;60.5;1730;792;-102.5541;942.5941;1;True;False
Node;AmplifyShaderEditor.FunctionNode;439;369.561,-689.8406;Inherit;False;DESF Module Wind;104;;3455;b135a554f7e4d0b41bba02c61b34ae74;11,2881,0,938,0,2457,0,2432,0,2434,0,2433,0,2371,0,2454,0,2752,0,2995,0,2878,0;0;2;FLOAT3;2190;FLOAT4;2970
Node;AmplifyShaderEditor.FunctionNode;444;597.766,-687.9767;Inherit;False;DESF Core Surface;20;;38532;c3df20d62907cd04086a1eacc41e29d1;18,1352,1,183,1,1382,1,1433,1,1432,1,1434,1,1638,0,1491,0,1588,0,1284,0,1446,0,1319,0,249,0,1318,0,1443,0,1337,0,1336,0,1407,0;2;309;FLOAT3;0,0,0;False;1262;FLOAT4;0,0,0,0;False;8;FLOAT4;42;FLOAT3;39;FLOAT;0;FLOAT4;41;COLOR;43;FLOAT;55;FLOAT;1624;FLOAT3;313
Node;AmplifyShaderEditor.CommentaryNode;442;1344.652,-238.8267;Inherit;False;287.6667;105;DESF Utility ASE Compile Shaders;1;443;;0,0.1964631,1,1;0;0
Node;AmplifyShaderEditor.FunctionNode;447;907.7413,-339.1844;Inherit;False;DESF HDRP Alpha Clip Threshold Shadow;11;;43141;022626164a79e9542a55b37bef6515ec;1,32,0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;443;1350.652,-202.8267;Inherit;False;DESF Utility ASE Compile Shaders;-1;;43146;b85b01c42ba8a8a448b731b68fc0dbd9;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;441;1073.754,-681.6232;Inherit;False;DESF Module Detail;78;;43147;49c077198be2bdb409ab6ad879c0ca28;4,201,1,200,1,347,0,346,0;2;39;FLOAT4;0,0,0,0;False;38;FLOAT3;0,0,1;False;2;FLOAT4;73;FLOAT3;72
Node;AmplifyShaderEditor.FunctionNode;445;1043.848,-753.9769;Inherit;False;DESF HDRP Bent Normal;74;;43151;0d561670847beae4e873b0b6acde227b;0;0;1;FLOAT3;9
Node;AmplifyShaderEditor.FunctionNode;448;1338.994,-745.9755;Inherit;False;DESF HDRP GUI 10x Surface Options;0;;43154;9785ff510f7360145a0c7695329a0dc0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;446;945.5552,-267.5942;Inherit;False;DESF HDRP Specular Geometric AA;7;;43155;1633571edcb81ad4a8487f62df12fd33;0;0;2;FLOAT;0;FLOAT;1
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;431;1374.904,-680.6909;Float;False;False;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;1;New Amplify Shader;53b46d85872c5b24c8f4f0a1c3fe4c87;True;Distortion;0;6;Distortion;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;True;4;1;False;-1;1;False;-1;4;1;False;-1;1;False;-1;True;1;False;-1;1;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;0;True;-10;255;False;-1;255;True;-11;7;False;-1;3;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;2;False;-1;True;3;False;-1;False;True;1;LightMode=DistortionVectors;False;False;0;;0;0;Standard;0;True;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;426;1374.904,-680.6909;Float;False;False;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;1;New Amplify Shader;53b46d85872c5b24c8f4f0a1c3fe4c87;True;META;0;1;META;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;;0;0;Standard;0;True;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;425;1335.904,-679.6909;Float;False;True;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;2;DEC/Surface Wind/Surface Wind Detail;53b46d85872c5b24c8f4f0a1c3fe4c87;True;GBuffer;0;0;GBuffer;35;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;4;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;NatureRendererInstancing=True;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;-25;False;False;False;False;False;False;False;False;False;True;True;0;True;-13;255;False;-1;255;True;-12;7;False;-1;3;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;False;True;0;True;-14;False;True;2;LightMode=GBuffer;NatureRendererInstancing=True;False;False;5;Include;;False;;Native;Pragma;instancing_options procedural:SetupNatureRenderer forwardadd;False;;Custom;Pragma;multi_compile GPU_FRUSTUM_ON __;False;;Custom;Include;Nature Renderer.cginc;False;2e03c613fd4055c4fb688be48c39a97a;Custom;Pragma;multi_compile_local _ NATURE_RENDERER;False;;Custom;;0;0;Standard;42;Surface Type;0;  Rendering Pass;1;  Refraction Model;0;    Blending Mode;0;    Blend Preserves Specular;1;  Receive Fog;1;  Back Then Front Rendering;0;  Transparent Depth Prepass;0;  Transparent Depth Postpass;0;  Transparent Writes Motion Vector;0;  Distortion;0;    Distortion Mode;0;    Distortion Depth Test;1;  ZWrite;0;  Z Test;4;Double-Sided;0;Alpha Clipping;1;  Use Shadow Threshold;1;Material Type,InvertActionOnDeselection;0;  Energy Conserving Specular;1;  Transmission;1;Receive Decals;1;Receives SSR;1;Receive SSR Transparent;0;Motion Vectors;1;  Add Precomputed Velocity;0;Specular AA;1;Specular Occlusion Mode;2;Override Baked GI;0;Depth Offset;0;DOTS Instancing;0;LOD CrossFade;1;Tessellation;0;  Phong;0;  Strength;0.5,False,-1;  Type;0;  Tess;16,False,-1;  Min;0,False,-1;  Max;25,False,-1;  Edge Length;16,False,-1;  Max Displacement;25,False,-1;Vertex Position;1;0;11;True;True;True;True;True;True;False;False;False;False;True;False;;True;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;429;1374.904,-680.6909;Float;False;False;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;1;New Amplify Shader;53b46d85872c5b24c8f4f0a1c3fe4c87;True;DepthOnly;0;4;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;-25;False;False;False;False;False;False;False;False;False;True;True;0;True;-6;255;False;-1;255;True;-7;7;False;-1;3;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;1;False;-1;False;False;True;1;LightMode=DepthOnly;False;False;0;;0;0;Standard;0;True;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;432;1374.904,-680.6909;Float;False;False;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;1;New Amplify Shader;53b46d85872c5b24c8f4f0a1c3fe4c87;True;TransparentBackface;0;7;TransparentBackface;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;True;1;0;True;-19;0;True;-20;1;0;True;-21;0;True;-22;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;-1;False;False;False;True;True;True;True;True;0;True;-44;False;False;False;False;False;False;False;True;0;True;-23;True;0;True;-31;False;True;1;LightMode=TransparentBackface;False;False;0;;0;0;Standard;0;True;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;427;1374.904,-680.6909;Float;False;False;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;1;New Amplify Shader;53b46d85872c5b24c8f4f0a1c3fe4c87;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;-25;False;True;False;False;False;False;0;False;-1;False;False;False;False;False;False;False;False;False;True;1;False;-1;True;3;False;-1;False;True;1;LightMode=ShadowCaster;False;False;0;;0;0;Standard;0;True;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;428;1374.904,-680.6909;Float;False;False;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;1;New Amplify Shader;53b46d85872c5b24c8f4f0a1c3fe4c87;True;SceneSelectionPass;0;3;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;False;False;False;False;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;;0;0;Standard;0;True;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;430;1374.904,-680.6909;Float;False;False;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;1;New Amplify Shader;53b46d85872c5b24c8f4f0a1c3fe4c87;True;Motion Vectors;0;5;Motion Vectors;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;-25;False;False;False;False;False;False;False;False;False;True;True;0;True;-8;255;False;-1;255;True;-9;7;False;-1;3;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;1;False;-1;False;False;True;1;LightMode=MotionVectors;False;False;0;;0;0;Standard;0;True;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;434;1374.904,-680.6909;Float;False;False;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;1;New Amplify Shader;53b46d85872c5b24c8f4f0a1c3fe4c87;True;TransparentDepthPostpass;0;9;TransparentDepthPostpass;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;True;1;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;-25;False;True;False;False;False;False;0;False;-1;False;False;False;False;False;False;False;False;False;True;1;False;-1;False;False;True;1;LightMode=TransparentDepthPostpass;False;False;0;;0;0;Standard;0;True;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;433;1374.904,-680.6909;Float;False;False;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;1;New Amplify Shader;53b46d85872c5b24c8f4f0a1c3fe4c87;True;TransparentDepthPrepass;0;8;TransparentDepthPrepass;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;True;1;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;-25;False;False;False;False;False;False;False;False;False;True;True;0;True;-7;255;False;-1;255;True;-8;7;False;-1;3;False;-1;1;False;-1;1;False;-1;7;False;-1;3;False;-1;1;False;-1;1;False;-1;False;True;1;False;-1;False;False;True;1;LightMode=TransparentDepthPrepass;False;False;0;;0;0;Standard;0;True;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;435;1374.904,-680.6909;Float;False;False;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;1;New Amplify Shader;53b46d85872c5b24c8f4f0a1c3fe4c87;True;Forward;0;10;Forward;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;True;1;0;True;-19;0;True;-20;1;0;True;-21;0;True;-22;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;-28;False;False;False;True;True;True;True;True;0;True;-44;False;False;False;False;False;True;True;0;True;-4;255;False;-1;255;True;-5;7;False;-1;3;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;0;True;-23;True;0;True;-30;False;True;1;LightMode=Forward;False;False;0;;0;0;Standard;0;True;0
WireConnection;444;309;439;2190
WireConnection;444;1262;439;2970
WireConnection;441;39;444;42
WireConnection;441;38;444;39
WireConnection;425;0;441;73
WireConnection;425;1;441;72
WireConnection;425;2;445;9
WireConnection;425;4;444;0
WireConnection;425;7;444;41
WireConnection;425;8;444;43
WireConnection;425;9;444;55
WireConnection;425;30;447;0
WireConnection;425;13;446;0
WireConnection;425;14;446;1
WireConnection;425;11;444;313
ASEEND*/
//CHKSM=3A047CA66EE937FA56C1E2D3DF64FADC39F44D2D
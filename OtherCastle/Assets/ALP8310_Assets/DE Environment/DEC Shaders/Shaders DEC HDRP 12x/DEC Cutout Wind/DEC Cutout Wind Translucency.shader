// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "DEC/Cutout Wind/Cutout Wind Translucency"
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
		[HideInInspector]_Cutoff("Cutoff", Float) = 0
		[DE_DrawerToggleNoKeyword]_GlancingClipMode("Enable Clip Glancing Angle", Float) = 1
		[Header(MAIN MAPS)]_Color("Tint", Color) = (1,1,1,0)
		[DE_DrawerTextureSingleLine]_MainTex("Albedo Map", 2D) = "white" {}
		_Brightness("Brightness", Range( 0 , 2)) = 1
		[DE_DrawerToggleNoKeyword]_EnableCustomAntialias("Enable Custom Antialias", Float) = 0
		_CustomCutoffAntialias("Custom Cutoff Antialias", Range( 0 , 0.99)) = 0.1
		_TilingX("Tiling X", Float) = 1
		_TilingY("Tiling Y", Float) = 1
		_OffsetX("Offset X", Float) = 0
		_OffsetY("Offset Y", Float) = 0
		[Normal][DE_DrawerTextureSingleLine]_BumpMap("Normal Map", 2D) = "bump" {}
		_NormalStrength("Normal Strength", Float) = 1
		[DE_DrawerTextureSingleLine]_OcclusionMap("Occlusion Map", 2D) = "white" {}
		[DE_DrawerToggleNoKeyword]_OcclusionSource("Occlusion is Baked", Float) = 0
		_OcclusionStrengthAO("Occlusion Strength", Range( 0 , 1)) = 0
		[DE_DrawerTextureSingleLine]_SmoothnessMap("Smoothness Map", 2D) = "white" {}
		[Enum(Smoothness,0,Roughness,1,Geometric,2)]_SmoothnessSource("Smoothness Source", Int) = 0
		[DE_DrawerSliderRemap(_SmoothnessMin, _SmoothnessMax,0, 1)]_Smoothness("Smoothness", Vector) = (0,0,0,0)
		[HideInInspector]_SmoothnessMin("Smoothness Min", Range( 0 , 1)) = 0
		[HideInInspector]_SmoothnessMax("Smoothness Max", Range( 0 , 1)) = 0
		[Header(COLOR SHIFT)][Enum(Off,0,Object Space,1,World Space,2,Vertex Color,3,Vertex Normal,4)]_ColorShift_Mode("Mode", Int) = 0
		_ColorShift_ShiftVariation("Shift Variation", Range( 0 , 1)) = 0.2
		_ColorShift_ShiftVariationRGB("Shift Variation RGB", Range( -0.5 , 0.5)) = 0.2
		_ColorShift_ShiftInfluence("Shift Influence ", Range( 0 , 1)) = 0.75
		_ColorShift_ShiftSaturation("Shift Saturation", Range( 0 , 1)) = 0.85
		_ColorShift_NoiseScale("Noise Scale", Range( 0 , 2)) = 1
		[Header(COLOR SHIFT (World Space Mode))]_ColorShift_WorldSpaceDistance("Distance", Range( 0.01 , 5)) = 5
		_ColorShift_WorldSpaceOffset("Offset", Range( -1 , 1)) = 1
		_ColorShift_WorldSpaceNoiseShift("Noise Shift", Range( 1 , 5)) = 5
		[Header(COLOR SHIFT (Mask))][Enum(Off,0,Active,1,Active Inverted,2)]_ColorShift_MaskMode("Mode", Int) = 0
		[DE_DrawerTextureSingleLine]_ColorShift_MaskMap("Mask Map", 2D) = "black" {}
		_ColorShift_MaskFuzziness("Mask Fuzziness", Range( 0 , 1)) = 0.25
		[Header(TRANSLUCENCY)][DE_DrawerToggleNoKeyword]_EnableTranslucency("Enable", Float) = 0
		[Enum(Texture,0,Texture Inverted,1,Baked,2)]_TranslucencySourceHDRP("Translucency Source", Int) = 1
		[NoScaleOffset][DE_DrawerTextureSingleLine]_TranslucencyMap("Translucency Map", 2D) = "white" {}
		_TranslucencyThickness("Thickness", Range( 0 , 1.5)) = 0.5
		_TranslucencyThicknessFeather("Thickness Feather", Range( 0 , 1)) = 1
		_SubsurfaceIntensityHDRP("Intensity", Range( 0 , 1)) = 0.8
		_TranslucentScatteringHDRP("Falloff", Range( 0 , 1)) = 0.65
		_SubsurfaceDistortionHDRP("Distortion", Range( 0 , 0.9)) = 0.5
		_SubsurfacePower("Power", Range( 0.01 , 49)) = 25
		
		[DiffusionProfile]_DiffusionProfileHash("Diffusion Profile", Float) = 0[Header(DIFFUSION PROFILE)][HideInInspector]_DiffusionProfileHash_Asset("Diffusion Profile", Vector) = ( 0, 0, 0, 0 )
		[Header(BENT NORMAL)][Enum(Tangent,0,Object,1)]_NormalMapSpace("Normal Map Space", Int) = 0
		[Normal][DE_DrawerTextureSingleLine]_BentNormalMap("Bent Normal Map", 2D) = "bump" {}
		_NormalStrengthBent("Bent Normal Strength", Float) = 1
		[Enum(Off,0,Global,1,Local,2)][Header(WIND)]_WindMode("Wind Mode", Int) = 1
		[Enum(Leaf,0,Palm,1,Grass,2,Simple,3,Ivy,4)]_WindType("Wind Type", Int) = 0
		[Header(WIND MODE GLOBAL)]_GlobalWindInfluenceOther("Main", Float) = 1
		_GlobalTurbulenceInfluence("Turbulence", Float) = 0.35
		[Header(WIND MODE LOCAL)]_LocalWindStrength("Main", Float) = 1
		_LocalWindTurbulence("Turbulence", Float) = 0.35
		_LocalWindPulse("Pulse Frequency", Float) = 0.1
		_LocalWindDirection("Direction", Range( 0 , 360)) = 0
		[ASEEnd]_LocalRandomWindOffset("Random Offset", Float) = 0.2
		[HideInInspector] _texcoord( "", 2D ) = "white" {}

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
			#define _MATERIAL_FEATURE_TRANSMISSION 1
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
			float4 _ColorShift_MaskMap_ST;
			float4 _Smoothness;
			float4 _Color;
			float _DoubleSidedGIMode;
			float _ColorShift_ShiftSaturation;
			float _ColorShift_MaskFuzziness;
			float _ColorShift_ShiftInfluence;
			half _NormalStrength;
			int _NormalMapSpace;
			half _NormalStrengthBent;
			int _SmoothnessSource;
			float _OcclusionStrengthAO;
			float _OcclusionSource;
			float _CustomCutoffAntialias;
			float _EnableCustomAntialias;
			float _GlancingClipMode;
			float _Cutoff;
			float _AlphaCutoffShadow;
			float _SpecularAAScreenSpaceVariance;
			float _EnableGeometricSpecularAA;
			float _SpecularAAThreshold;
			float _SubsurfaceDistortionHDRP;
			float _SubsurfacePower;
			float _SubsurfaceIntensityHDRP;
			int _TranslucencySourceHDRP;
			float _TranslucencyThicknessFeather;
			float _TranslucencyThickness;
			float _TranslucentScatteringHDRP;
			float _ColorShift_ShiftVariationRGB;
			float _ColorShift_ShiftVariation;
			float _ColorShift_WorldSpaceDistance;
			float _ColorShift_WorldSpaceOffset;
			half _EmissionFlags;
			float _TransparentWritingMotionVec;
			float _EnableBlendModePreserveSpecularLighting;
			float _AlphaToMaskInspectorValue;
			int _OpaqueCullMode;
			float _SmoothnessMax;
			float _SmoothnessMin;
			int _WindMode;
			int _WindType;
			float _GlobalWindInfluenceOther;
			float _LocalWindStrength;
			float _LocalRandomWindOffset;
			float _LocalWindPulse;
			float _LocalWindDirection;
			float _GlobalTurbulenceInfluence;
			float _LocalWindTurbulence;
			int _ColorShift_Mode;
			float _TilingX;
			float _TilingY;
			float _OffsetX;
			float _OffsetY;
			half _Brightness;
			int _ColorShift_MaskMode;
			float _ColorShift_NoiseScale;
			float _ColorShift_WorldSpaceNoiseShift;
			float _EnableTranslucency;
			float _DiffusionProfileHash;
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
			float _Global_Wind_Main_Turbulence;
			float _Global_Wind_Main_Fade_Bias;
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_trilinear_repeat);
			TEXTURE2D(_ColorShift_MaskMap);
			TEXTURE2D(_BumpMap);
			TEXTURE2D(_BentNormalMap);
			TEXTURE2D(_SmoothnessMap);
			TEXTURE2D(_OcclusionMap);
			TEXTURE2D(_TranslucencyMap);


			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_TANGENT
			#define ASE_NEEDS_FRAG_RELATIVE_WORLD_POS
			#define ASE_NEEDS_FRAG_POSITION
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_COLOR
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
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
				float4 ase_texcoord3 : TEXCOORD3;
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
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_color : COLOR;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord7 : TEXCOORD7;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};


			float4 mod289( float4 x )
			{
				return x - floor(x * (1.0 / 289.0)) * 289.0;
			}
			
			float4 perm( float4 x )
			{
				return mod289(((x * 34.0) + 1.0) * x);
			}
			
			float SimpleNoise3D( float3 p )
			{
				 float3 a = floor(p);
				    float3 d = p - a;
				    d = d * d * (3.0 - 2.0 * d);
				 float4 b = a.xxyy + float4(0.0, 1.0, 0.0, 1.0);
				    float4 k1 = perm(b.xyxy);
				 float4 k2 = perm(k1.xyxy + b.zzww);
				    float4 c = k2 + a.zzzz;
				    float4 k3 = perm(c);
				    float4 k4 = perm(c + 1.0);
				    float4 o1 = frac(k3 * (1.0 / 41.0));
				 float4 o2 = frac(k4 * (1.0 / 41.0));
				    float4 o3 = o2 * d.z + o1 * (1.0 - d.z);
				    float2 o4 = o3.yw * d.x + o3.xz * (1.0 - d.x);
				    return o4.y * d.y + o4.x * (1.0 - d.y);
			}
			
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
			
			float3 Wind_Typefloat3switch2439_g3466( int m_switch, float3 m_Leaf, float3 m_Palm, float3 m_Grass, float3 m_Simple, float3 m_Ivy )
			{
				if(m_switch ==0)
					return m_Leaf;
				else if(m_switch ==1)
					return m_Palm;
				else if(m_switch ==2)
					return m_Grass;
				else if(m_switch ==3)
					return m_Simple;
				else if(m_switch ==4)
					return m_Ivy;
				else
				return float3(0,0,0);
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
			
			float3 Wind_Fadefloat3switch3050_g3466( int m_switch, float3 m_Off, float3 m_ActiveFadeOut, float3 m_ActiveFadeIn )
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
			
			float3 HSVToRGB( float3 c )
			{
				float4 K = float4( 1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0 );
				float3 p = abs( frac( c.xxx + K.xyz ) * 6.0 - K.www );
				return c.z * lerp( K.xxx, saturate( p - K.xxx ), c.y );
			}
			
			float ColorShift_Modefloatswitch168_g43432( int m_switch, float m_Off, float m_ObjectSpace, float m_WorldSpace, float m_VertexColor, float m_VertexNormal )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_ObjectSpace;
				else if(m_switch ==2)
					return m_WorldSpace;
				else if(m_switch ==3)
					return m_VertexColor;
				else if(m_switch ==4)
					return m_VertexNormal;
				else
				return float(0);
			}
			
			float3 RGBToHSV(float3 c)
			{
				float4 K = float4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
				float4 p = lerp( float4( c.bg, K.wz ), float4( c.gb, K.xy ), step( c.b, c.g ) );
				float4 q = lerp( float4( p.xyw, c.r ), float4( c.r, p.yzx ), step( p.x, c.r ) );
				float d = q.x - min( q.w, q.y );
				float e = 1.0e-10;
				return float3( abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
			}
			float4 ColorShift_Maskfloat4switch313_g43432( int m_switch, float4 m_Off, float4 m_Active, float4 m_ActiveInverted )
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
			
			float4 ColorShift_Modefloat4switch364_g43432( int m_switch, float4 m_Off, float4 m_ObjectSpace, float4 m_WorldSpace, float4 m_VertexColor, float4 m_VertexNormal )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_ObjectSpace;
				else if(m_switch ==2)
					return m_WorldSpace;
				else if(m_switch ==3)
					return m_VertexColor;
				else if(m_switch ==4)
					return m_VertexNormal;
				else
				return float4(0,0,0,0);
			}
			
			float3 ASEUnpackNormalRGB(float4 PackedNormal, float Scale = 1.0 )
			{
				float3 normal;
				normal.xyz = PackedNormal.rgb * 2.0 - 1.0;
				normal.xy *= Scale;
				return normal;
			}
			
			float3 _BentNormal_Spacefloat3switch6_g43461( int m_switch, float3 m_TangentSpace, float3 m_ObjectSpace )
			{
				if(m_switch ==0)
					return m_TangentSpace;
				else if(m_switch ==1)
					return m_ObjectSpace;
				else
				return float3(0,0,0);
			}
			
			float4 SmoothnessTypefloat4switch215_g43455( int m_switch, float4 m_Smoothness, float4 m_Roughness, float4 m_Geometric )
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
			
			float4 float4switch38_g43448( int m_switch, float4 m_Texture, float4 m_TextureInverted, float4 m_Baked )
			{
				if(m_switch ==0)
					return m_Texture;
				else if(m_switch ==1)
					return m_TextureInverted;
				else if(m_switch ==2)
					return m_Baked;
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

				int m_switch3050_g3466 = _Global_Wind_Main_Fade_Enabled;
				int m_switch2453_g3466 = _WindMode;
				float3 m_Off2453_g3466 = float3(0,0,0);
				int m_switch2439_g3466 = _WindType;
				float3 VERTEX_POSITION_MATRIX2352_g3466 = mul( GetObjectToWorldMatrix(), float4( inputMesh.positionOS , 0.0 ) ).xyz;
				float3 break2265_g3466 = VERTEX_POSITION_MATRIX2352_g3466;
				int WIND_MODE2462_g3466 = _WindMode;
				int m_switch2458_g3466 = WIND_MODE2462_g3466;
				float m_Off2458_g3466 = 1.0;
				float m_Global2458_g3466 = ( _GlobalWindInfluenceOther * _Global_Wind_Main_Intensity );
				float m_Local2458_g3466 = _LocalWindStrength;
				float localWind_Globalfloatswitch2458_g3466 = Wind_Globalfloatswitch( m_switch2458_g3466 , m_Off2458_g3466 , m_Global2458_g3466 , m_Local2458_g3466 );
				float _WIND_STRENGHT2400_g3466 = localWind_Globalfloatswitch2458_g3466;
				int m_switch2468_g3466 = WIND_MODE2462_g3466;
				float m_Off2468_g3466 = 1.0;
				float m_Global2468_g3466 = _Global_Wind_Main_RandomOffset;
				float m_Local2468_g3466 = _LocalRandomWindOffset;
				float localWind_Globalfloatswitch2468_g3466 = Wind_Globalfloatswitch( m_switch2468_g3466 , m_Off2468_g3466 , m_Global2468_g3466 , m_Local2468_g3466 );
				float4 transform3073_g3466 = mul(GetObjectToWorldMatrix(),float4( 0,0,0,1 ));
				transform3073_g3466.xyz = GetAbsolutePositionWS((transform3073_g3466).xyz);
				float2 appendResult2307_g3466 = (float2(transform3073_g3466.x , transform3073_g3466.z));
				float dotResult2341_g3466 = dot( appendResult2307_g3466 , float2( 12.9898,78.233 ) );
				float lerpResult2238_g3466 = lerp( 0.8 , ( ( localWind_Globalfloatswitch2468_g3466 / 2.0 ) + 0.9 ) , frac( ( sin( dotResult2341_g3466 ) * 43758.55 ) ));
				float _WIND_RANDOM_OFFSET2244_g3466 = ( ( _TimeParameters.x * 0.05 ) * lerpResult2238_g3466 );
				float _WIND_TUBULENCE_RANDOM2274_g3466 = ( sin( ( ( _WIND_RANDOM_OFFSET2244_g3466 * 40.0 ) - ( VERTEX_POSITION_MATRIX2352_g3466.z / 15.0 ) ) ) * 0.5 );
				int m_switch2312_g3466 = WIND_MODE2462_g3466;
				float m_Off2312_g3466 = 1.0;
				float m_Global2312_g3466 = _Global_Wind_Main_Pulse;
				float m_Local2312_g3466 = _LocalWindPulse;
				float localWind_Globalfloatswitch2312_g3466 = Wind_Globalfloatswitch( m_switch2312_g3466 , m_Off2312_g3466 , m_Global2312_g3466 , m_Local2312_g3466 );
				float _WIND_PULSE2421_g3466 = localWind_Globalfloatswitch2312_g3466;
				float FUNC_Angle2470_g3466 = ( _WIND_STRENGHT2400_g3466 * ( 1.0 + sin( ( ( ( ( _WIND_RANDOM_OFFSET2244_g3466 * 2.0 ) + _WIND_TUBULENCE_RANDOM2274_g3466 ) - ( VERTEX_POSITION_MATRIX2352_g3466.z / 50.0 ) ) - ( inputMesh.ase_color.r / 20.0 ) ) ) ) * sqrt( inputMesh.ase_color.r ) * _WIND_PULSE2421_g3466 );
				float FUNC_Angle_SinA2424_g3466 = sin( FUNC_Angle2470_g3466 );
				float FUNC_Angle_CosA2362_g3466 = cos( FUNC_Angle2470_g3466 );
				int m_switch2456_g3466 = WIND_MODE2462_g3466;
				float m_Off2456_g3466 = 1.0;
				float m_Global2456_g3466 = _Global_Wind_Main_Direction;
				float m_Local2456_g3466 = _LocalWindDirection;
				float localWind_Globalfloatswitch2456_g3466 = Wind_Globalfloatswitch( m_switch2456_g3466 , m_Off2456_g3466 , m_Global2456_g3466 , m_Local2456_g3466 );
				float _WindDirection2249_g3466 = localWind_Globalfloatswitch2456_g3466;
				float2 localDirectionalEquation2249_g3466 = DirectionalEquation( _WindDirection2249_g3466 );
				float2 break2469_g3466 = localDirectionalEquation2249_g3466;
				float _WIND_DIRECTION_X2418_g3466 = break2469_g3466.x;
				float lerpResult2258_g3466 = lerp( break2265_g3466.x , ( ( break2265_g3466.y * FUNC_Angle_SinA2424_g3466 ) + ( break2265_g3466.x * FUNC_Angle_CosA2362_g3466 ) ) , _WIND_DIRECTION_X2418_g3466);
				float3 break2340_g3466 = VERTEX_POSITION_MATRIX2352_g3466;
				float3 break2233_g3466 = VERTEX_POSITION_MATRIX2352_g3466;
				float _WIND_DIRECTION_Y2416_g3466 = break2469_g3466.y;
				float lerpResult2275_g3466 = lerp( break2233_g3466.z , ( ( break2233_g3466.y * FUNC_Angle_SinA2424_g3466 ) + ( break2233_g3466.z * FUNC_Angle_CosA2362_g3466 ) ) , _WIND_DIRECTION_Y2416_g3466);
				float3 appendResult2235_g3466 = (float3(lerpResult2258_g3466 , ( ( break2340_g3466.y * FUNC_Angle_CosA2362_g3466 ) - ( break2340_g3466.z * FUNC_Angle_SinA2424_g3466 ) ) , lerpResult2275_g3466));
				float3 VERTEX_POSITION2282_g3466 = ( mul( GetWorldToObjectMatrix(), float4( appendResult2235_g3466 , 0.0 ) ).xyz - inputMesh.positionOS );
				float3 break2518_g3466 = VERTEX_POSITION2282_g3466;
				half FUNC_SinFunction2336_g3466 = sin( ( ( _WIND_RANDOM_OFFSET2244_g3466 * 200.0 * ( 0.2 + inputMesh.ase_color.g ) ) + ( inputMesh.ase_color.g * 10.0 ) + _WIND_TUBULENCE_RANDOM2274_g3466 + ( VERTEX_POSITION_MATRIX2352_g3466.z / 2.0 ) ) );
				int m_switch2326_g3466 = WIND_MODE2462_g3466;
				float m_Off2326_g3466 = 1.0;
				float m_Global2326_g3466 = ( _GlobalTurbulenceInfluence * _Global_Wind_Main_Turbulence );
				float m_Local2326_g3466 = _LocalWindTurbulence;
				float localWind_Globalfloatswitch2326_g3466 = Wind_Globalfloatswitch( m_switch2326_g3466 , m_Off2326_g3466 , m_Global2326_g3466 , m_Local2326_g3466 );
				float _WIND_TUBULENCE2442_g3466 = localWind_Globalfloatswitch2326_g3466;
				float3 appendResult2480_g3466 = (float3(break2518_g3466.x , ( break2518_g3466.y + ( FUNC_SinFunction2336_g3466 * inputMesh.ase_color.b * ( FUNC_Angle2470_g3466 + ( _WIND_STRENGHT2400_g3466 / 200.0 ) ) * _WIND_TUBULENCE2442_g3466 ) ) , break2518_g3466.z));
				float3 VERTEX_LEAF2396_g3466 = appendResult2480_g3466;
				float3 m_Leaf2439_g3466 = VERTEX_LEAF2396_g3466;
				float3 VERTEX_PALM2310_g3466 = ( ( FUNC_SinFunction2336_g3466 * inputMesh.ase_color.b * ( FUNC_Angle2470_g3466 + ( _WIND_STRENGHT2400_g3466 / 200.0 ) ) * _WIND_TUBULENCE2442_g3466 ) + VERTEX_POSITION2282_g3466 );
				float3 m_Palm2439_g3466 = VERTEX_PALM2310_g3466;
				float3 break2486_g3466 = VERTEX_POSITION2282_g3466;
				float temp_output_2514_0_g3466 = ( FUNC_SinFunction2336_g3466 * inputMesh.ase_color.b * ( FUNC_Angle2470_g3466 + ( _WIND_STRENGHT2400_g3466 / 200.0 ) ) );
				float lerpResult2482_g3466 = lerp( 0.0 , temp_output_2514_0_g3466 , _WIND_DIRECTION_X2418_g3466);
				float lerpResult2484_g3466 = lerp( 0.0 , temp_output_2514_0_g3466 , _WIND_DIRECTION_Y2416_g3466);
				float3 appendResult2489_g3466 = (float3(( break2486_g3466.x + lerpResult2482_g3466 ) , break2486_g3466.y , ( break2486_g3466.z + lerpResult2484_g3466 )));
				float3 VERTEX_GRASS2242_g3466 = appendResult2489_g3466;
				float3 m_Grass2439_g3466 = VERTEX_GRASS2242_g3466;
				float3 m_Simple2439_g3466 = VERTEX_POSITION2282_g3466;
				float clampResult2884_g3466 = clamp( ( _WIND_STRENGHT2400_g3466 - 0.95 ) , 0.0 , 1.0 );
				float3 break2708_g3466 = VERTEX_POSITION2282_g3466;
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				float3 break2718_g3466 = ase_worldPos;
				float temp_output_2690_0_g3466 = ( _WIND_RANDOM_OFFSET2244_g3466 * 25.0 );
				float clampResult2691_g3466 = clamp( 25.0 , 0.2 , 0.25 );
				float2 appendResult2694_g3466 = (float2(temp_output_2690_0_g3466 , ( temp_output_2690_0_g3466 / clampResult2691_g3466 )));
				float3 appendResult2706_g3466 = (float3(break2708_g3466.x , ( break2708_g3466.y + cos( ( ( ( break2718_g3466.x + break2718_g3466.y + break2718_g3466.z ) * 2.0 ) + appendResult2694_g3466 + FUNC_Angle2470_g3466 + _WIND_TUBULENCE2442_g3466 ) ) ).x , break2708_g3466.z));
				float3 temp_output_2613_0_g3466 = ( clampResult2884_g3466 * appendResult2706_g3466 );
				float3 VERTEX_IVY997_g3466 = ( ( ( cos( temp_output_2613_0_g3466 ) + ( -0.3193 * PI ) ) * inputMesh.normalOS * 0.2 * ( FUNC_SinFunction2336_g3466 * inputMesh.ase_color.b ) ) + ( sin( temp_output_2613_0_g3466 ) * cross( inputMesh.normalOS , inputMesh.tangentOS.xyz ) * 0.2 ) );
				float3 m_Ivy2439_g3466 = VERTEX_IVY997_g3466;
				float3 localWind_Typefloat3switch2439_g3466 = Wind_Typefloat3switch2439_g3466( m_switch2439_g3466 , m_Leaf2439_g3466 , m_Palm2439_g3466 , m_Grass2439_g3466 , m_Simple2439_g3466 , m_Ivy2439_g3466 );
				float3 m_Global2453_g3466 = localWind_Typefloat3switch2439_g3466;
				float3 m_Local2453_g3466 = localWind_Typefloat3switch2439_g3466;
				float3 localWind_Globalfloat3switch2453_g3466 = Wind_Globalfloat3switch( m_switch2453_g3466 , m_Off2453_g3466 , m_Global2453_g3466 , m_Local2453_g3466 );
				float3 m_Off3050_g3466 = localWind_Globalfloat3switch2453_g3466;
				float temp_output_3048_0_g3466 = saturate( pow( ( distance( _WorldSpaceCameraPos , ase_worldPos ) / _Global_Wind_Main_Fade_Bias ) , 5.0 ) );
				float3 m_ActiveFadeOut3050_g3466 = ( localWind_Globalfloat3switch2453_g3466 * ( 1.0 - temp_output_3048_0_g3466 ) );
				float3 m_ActiveFadeIn3050_g3466 = ( localWind_Globalfloat3switch2453_g3466 * temp_output_3048_0_g3466 );
				float3 localWind_Fadefloat3switch3050_g3466 = Wind_Fadefloat3switch3050_g3466( m_switch3050_g3466 , m_Off3050_g3466 , m_ActiveFadeOut3050_g3466 , m_ActiveFadeIn3050_g3466 );
				float3 temp_output_1234_0_g43431 = localWind_Fadefloat3switch3050_g3466;
				
				float3 ase_worldNormal = TransformObjectToWorldNormal(inputMesh.normalOS);
				float3 ase_worldTangent = TransformObjectToWorldDir(inputMesh.tangentOS.xyz);
				float ase_vertexTangentSign = inputMesh.tangentOS.w * unity_WorldTransformParams.w;
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				outputPackedVaryingsMeshToPS.ase_texcoord7.xyz = ase_worldBitangent;
				
				outputPackedVaryingsMeshToPS.ase_texcoord5.xy = inputMesh.ase_texcoord.xy;
				outputPackedVaryingsMeshToPS.ase_texcoord6 = float4(inputMesh.positionOS,1);
				outputPackedVaryingsMeshToPS.ase_color = inputMesh.ase_color;
				outputPackedVaryingsMeshToPS.ase_normal = inputMesh.normalOS;
				outputPackedVaryingsMeshToPS.ase_texcoord5.zw = inputMesh.ase_texcoord3.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord7.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = temp_output_1234_0_g43431;

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
				float4 ase_texcoord3 : TEXCOORD3;

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
				o.ase_texcoord3 = v.ase_texcoord3;
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
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
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
				int m_switch364_g43432 = _ColorShift_Mode;
				float2 appendResult168_g43431 = (float2(_TilingX , _TilingY));
				float2 appendResult167_g43431 = (float2(_OffsetX , _OffsetY));
				float2 texCoord2_g43454 = packedInput.ase_texcoord5.xy * appendResult168_g43431 + appendResult167_g43431;
				float2 OUT_UV213_g43431 = texCoord2_g43454;
				float2 UV40_g43445 = OUT_UV213_g43431;
				float4 tex2DNode63_g43445 = SAMPLE_TEXTURE2D( _MainTex, sampler_trilinear_repeat, UV40_g43445 );
				float4 ALBEDO_RGBA1381_g43431 = tex2DNode63_g43445;
				float3 temp_output_3_0_g43431 = ( (_Color).rgb * (ALBEDO_RGBA1381_g43431).rgb * _Brightness );
				float3 temp_output_134_0_g43432 = temp_output_3_0_g43431;
				float4 m_Off364_g43432 = float4( temp_output_134_0_g43432 , 0.0 );
				int m_switch313_g43432 = _ColorShift_MaskMode;
				int MODE176_g43432 = _ColorShift_Mode;
				int m_switch168_g43432 = MODE176_g43432;
				float m_Off168_g43432 = 0.0;
				float m_ObjectSpace168_g43432 = ( _ColorShift_NoiseScale / 3 );
				float3 ase_worldPos = GetAbsolutePositionWS( positionRWS );
				float3 p1_g43433 = ( ase_worldPos * _ColorShift_WorldSpaceNoiseShift );
				float localSimpleNoise3D1_g43433 = SimpleNoise3D( p1_g43433 );
				float4 transform374_g43432 = mul(GetObjectToWorldMatrix(),packedInput.ase_texcoord6);
				transform374_g43432.xyz = GetAbsolutePositionWS((transform374_g43432).xyz);
				float m_WorldSpace168_g43432 = ( ( localSimpleNoise3D1_g43433 / _ColorShift_NoiseScale ) - ( ( (transform374_g43432).w - _ColorShift_WorldSpaceOffset ) / _ColorShift_WorldSpaceDistance ) );
				float m_VertexColor168_g43432 = ( packedInput.ase_color.g - 0.5 );
				float m_VertexNormal168_g43432 = ( packedInput.ase_normal.y - 0.5 );
				float localColorShift_Modefloatswitch168_g43432 = ColorShift_Modefloatswitch168_g43432( m_switch168_g43432 , m_Off168_g43432 , m_ObjectSpace168_g43432 , m_WorldSpace168_g43432 , m_VertexColor168_g43432 , m_VertexNormal168_g43432 );
				float temp_output_112_0_g43432 = sin( ( _ColorShift_NoiseScale * PI ) );
				float3 ALBEDO_IN136_g43432 = temp_output_134_0_g43432;
				float2 appendResult120_g43432 = (float2(( (0.3 + (( 1.0 - temp_output_112_0_g43432 ) - 0.0) * (1.0 - 0.3) / (1.0 - 0.0)) * float4( ALBEDO_IN136_g43432 , 0.0 ).x ) , 0.0));
				float2 RGB146_g43432 = appendResult120_g43432;
				float3 hsvTorgb122_g43432 = RGBToHSV( float3( RGB146_g43432 ,  0.0 ) );
				float VALUE219_g43432 = temp_output_112_0_g43432;
				float3 hsvTorgb126_g43432 = HSVToRGB( float3(( ( saturate( localColorShift_Modefloatswitch168_g43432 ) * _ColorShift_ShiftVariation ) + _ColorShift_ShiftVariationRGB + hsvTorgb122_g43432 ).x,( _ColorShift_ShiftSaturation * hsvTorgb122_g43432.y ),( hsvTorgb122_g43432.z + ( VALUE219_g43432 / 40 ) )) );
				float4 m_Off313_g43432 = float4( hsvTorgb126_g43432 , 0.0 );
				float2 uv_ColorShift_MaskMap = packedInput.ase_texcoord5.xy * _ColorShift_MaskMap_ST.xy + _ColorShift_MaskMap_ST.zw;
				float4 transform376_g43432 = mul(GetObjectToWorldMatrix(),float4( packedInput.ase_texcoord6.xyz , 0.0 ));
				transform376_g43432.xyz = GetAbsolutePositionWS((transform376_g43432).xyz);
				float4 temp_output_337_0_g43432 = saturate( ( 1.0 - ( ( SAMPLE_TEXTURE2D( _ColorShift_MaskMap, sampler_trilinear_repeat, uv_ColorShift_MaskMap ) * transform376_g43432 ) / max( _ColorShift_MaskFuzziness , 1E-05 ) ) ) );
				float3 lerpResult314_g43432 = lerp( hsvTorgb126_g43432 , ALBEDO_IN136_g43432 , temp_output_337_0_g43432.rgb);
				float4 m_Active313_g43432 = float4( lerpResult314_g43432 , 0.0 );
				float3 lerpResult311_g43432 = lerp( ALBEDO_IN136_g43432 , hsvTorgb126_g43432 , temp_output_337_0_g43432.rgb);
				float4 m_ActiveInverted313_g43432 = float4( lerpResult311_g43432 , 0.0 );
				float4 localColorShift_Maskfloat4switch313_g43432 = ColorShift_Maskfloat4switch313_g43432( m_switch313_g43432 , m_Off313_g43432 , m_Active313_g43432 , m_ActiveInverted313_g43432 );
				float4 lerpResult297_g43432 = lerp( float4( temp_output_134_0_g43432 , 0.0 ) , localColorShift_Maskfloat4switch313_g43432 , _ColorShift_ShiftInfluence);
				float4 m_ObjectSpace364_g43432 = lerpResult297_g43432;
				float4 m_WorldSpace364_g43432 = lerpResult297_g43432;
				float4 m_VertexColor364_g43432 = lerpResult297_g43432;
				float4 m_VertexNormal364_g43432 = lerpResult297_g43432;
				float4 localColorShift_Modefloat4switch364_g43432 = ColorShift_Modefloat4switch364_g43432( m_switch364_g43432 , m_Off364_g43432 , m_ObjectSpace364_g43432 , m_WorldSpace364_g43432 , m_VertexColor364_g43432 , m_VertexNormal364_g43432 );
				
				float4 NORMAL_RGB1382_g43431 = SAMPLE_TEXTURE2D( _BumpMap, sampler_trilinear_repeat, UV40_g43445 );
				float4 temp_output_1_0_g43450 = NORMAL_RGB1382_g43431;
				float temp_output_8_0_g43450 = _NormalStrength;
				float3 unpack52_g43450 = UnpackNormalScale( temp_output_1_0_g43450, temp_output_8_0_g43450 );
				unpack52_g43450.z = lerp( 1, unpack52_g43450.z, saturate(temp_output_8_0_g43450) );
				float3 temp_output_1519_59_g43431 = unpack52_g43450;
				float3 NORMAL_IN42_g43456 = temp_output_1519_59_g43431;
				float3 temp_output_1610_30_g43431 = NORMAL_IN42_g43456;
				
				int m_switch6_g43461 = _NormalMapSpace;
				float2 texCoord16_g43461 = packedInput.ase_texcoord5.xy * float2( 1,1 ) + float2( 0,0 );
				float4 temp_output_1_0_g43463 = SAMPLE_TEXTURE2D( _BentNormalMap, sampler_trilinear_repeat, texCoord16_g43461 );
				float temp_output_8_0_g43463 = _NormalStrengthBent;
				float3 unpack52_g43463 = UnpackNormalScale( temp_output_1_0_g43463, temp_output_8_0_g43463 );
				unpack52_g43463.z = lerp( 1, unpack52_g43463.z, saturate(temp_output_8_0_g43463) );
				float3 m_TangentSpace6_g43461 = unpack52_g43463;
				float temp_output_74_0_g43463 = ( 1.0 - temp_output_8_0_g43463 );
				float3 m_ObjectSpace6_g43461 = ASEUnpackNormalRGB(temp_output_1_0_g43463,temp_output_74_0_g43463);
				float3 local_BentNormal_Spacefloat3switch6_g43461 = _BentNormal_Spacefloat3switch6_g43461( m_switch6_g43461 , m_TangentSpace6_g43461 , m_ObjectSpace6_g43461 );
				
				int temp_output_223_0_g43455 = _SmoothnessSource;
				int m_switch215_g43455 = temp_output_223_0_g43455;
				float4 MASK_G158_g43431 = SAMPLE_TEXTURE2D( _SmoothnessMap, sampler_trilinear_repeat, UV40_g43445 );
				float4 temp_cast_16 = (_SmoothnessMin).xxxx;
				float4 temp_cast_17 = (_SmoothnessMax).xxxx;
				float4 temp_output_216_0_g43455 = (temp_cast_16 + (MASK_G158_g43431 - float4( 0,0,0,0 )) * (temp_cast_17 - temp_cast_16) / (float4( 1,1,1,1 ) - float4( 0,0,0,0 )));
				float4 m_Smoothness215_g43455 = temp_output_216_0_g43455;
				float4 temp_cast_18 = (_SmoothnessMin).xxxx;
				float4 temp_cast_19 = (_SmoothnessMax).xxxx;
				float4 temp_output_214_0_g43455 = ( 1.0 - temp_output_216_0_g43455 );
				float4 m_Roughness215_g43455 = temp_output_214_0_g43455;
				float4 temp_cast_20 = (_SmoothnessMin).xxxx;
				float4 temp_cast_21 = (_SmoothnessMax).xxxx;
				float3 NORMAL_OUT1491_g43431 = temp_output_1610_30_g43431;
				float3 ase_worldBitangent = packedInput.ase_texcoord7.xyz;
				float3 tanToWorld0 = float3( tangentWS.xyz.x, ase_worldBitangent.x, normalWS.x );
				float3 tanToWorld1 = float3( tangentWS.xyz.y, ase_worldBitangent.y, normalWS.y );
				float3 tanToWorld2 = float3( tangentWS.xyz.z, ase_worldBitangent.z, normalWS.z );
				float3 tanNormal1608_g43431 = NORMAL_OUT1491_g43431;
				float3 worldNormal1608_g43431 = normalize( float3(dot(tanToWorld0,tanNormal1608_g43431), dot(tanToWorld1,tanNormal1608_g43431), dot(tanToWorld2,tanNormal1608_g43431)) );
				float3 temp_output_4_0_g43455 = worldNormal1608_g43431;
				float3 temp_output_178_0_g43455 = ddx( temp_output_4_0_g43455 );
				float dotResult195_g43455 = dot( temp_output_178_0_g43455 , temp_output_178_0_g43455 );
				float3 temp_output_175_0_g43455 = ddy( temp_output_4_0_g43455 );
				float dotResult201_g43455 = dot( temp_output_175_0_g43455 , temp_output_175_0_g43455 );
				float ALBEDO_R172_g43431 = tex2DNode63_g43445.r;
				float4 temp_cast_22 = (ALBEDO_R172_g43431).xxxx;
				float4 m_Geometric215_g43455 = ( sqrt( saturate( ( temp_output_216_0_g43455 + ( ( dotResult195_g43455 + dotResult201_g43455 ) * 2.0 ) ) ) ) * ( 1.0 - temp_cast_22 ) );
				float4 localSmoothnessTypefloat4switch215_g43455 = SmoothnessTypefloat4switch215_g43455( m_switch215_g43455 , m_Smoothness215_g43455 , m_Roughness215_g43455 , m_Geometric215_g43455 );
				float4 temp_output_1635_33_g43431 = localSmoothnessTypefloat4switch215_g43455;
				float4 PBR_Occlusion1712_g43431 = SAMPLE_TEXTURE2D( _OcclusionMap, sampler_trilinear_repeat, UV40_g43445 );
				float temp_output_16_0_g43444 = _OcclusionStrengthAO;
				float temp_output_65_0_g43444 = ( 1.0 - temp_output_16_0_g43444 );
				float3 appendResult69_g43444 = (float3(temp_output_65_0_g43444 , temp_output_65_0_g43444 , temp_output_65_0_g43444));
				float4 color77_g43444 = IsGammaSpace() ? float4(1,1,1,1) : float4(1,1,1,1);
				float4 temp_cast_25 = (packedInput.ase_color.a).xxxx;
				float4 lerpResult75_g43444 = lerp( color77_g43444 , temp_cast_25 , temp_output_16_0_g43444);
				float4 lerpResult83_g43444 = lerp( float4( ( ( ( (PBR_Occlusion1712_g43431).xyz - float3( 0.5,0.5,0.5 ) ) * temp_output_16_0_g43444 ) + appendResult69_g43444 ) , 0.0 ) , lerpResult75_g43444 , _OcclusionSource);
				float4 Occlusion1628_g43431 = saturate( lerpResult83_g43444 );
				
				float ALBEDO_A926_g43431 = tex2DNode63_g43445.a;
				float temp_output_1_0_g43439 = ALBEDO_A926_g43431;
				float temp_output_6_0_g43439 = ( step( _CustomCutoffAntialias , temp_output_1_0_g43439 ) - step( temp_output_1_0_g43439 , _CustomCutoffAntialias ) );
				float lerpResult10_g43439 = lerp( temp_output_1_0_g43439 , saturate( ( temp_output_6_0_g43439 / fwidth( temp_output_6_0_g43439 ) ) ) , _EnableCustomAntialias);
				float Albedo_Alpha52_g43443 = lerpResult10_g43439;
				float3 normalizeResult38_g43443 = normalize( cross( ddx( ase_worldPos ) , ddy( ase_worldPos ) ) );
				float dotResult35_g43443 = dot( normalizeResult38_g43443 , V );
				float temp_output_32_0_g43443 = ( 1.0 - abs( dotResult35_g43443 ) );
				float lerpResult67_g43443 = lerp( 1.0 , ( 1.0 - ( temp_output_32_0_g43443 * temp_output_32_0_g43443 ) ) , _GlancingClipMode);
				float OpacityMask42_g43443 = lerpResult67_g43443;
				
				float lerpResult3_g43466 = lerp( 0.0 , _SpecularAAScreenSpaceVariance , _EnableGeometricSpecularAA);
				
				float lerpResult4_g43466 = lerp( 0.0 , _SpecularAAThreshold , _EnableGeometricSpecularAA);
				
				float3 tanNormal1607_g43431 = NORMAL_OUT1491_g43431;
				float3 worldNormal1607_g43431 = float3(dot(tanToWorld0,tanNormal1607_g43431), dot(tanToWorld1,tanNormal1607_g43431), dot(tanToWorld2,tanNormal1607_g43431));
				float3 temp_output_68_0_g43448 = ( worldNormal1607_g43431 * ( 1.0 - _SubsurfaceDistortionHDRP ) );
				float3 normalizeResult63_g43448 = normalize( ( -( -_DirectionalLightDatas[0].forward + temp_output_68_0_g43448 ) * temp_output_68_0_g43448 ) );
				float dotResult74_g43448 = dot( V , normalizeResult63_g43448 );
				int m_switch38_g43448 = _TranslucencySourceHDRP;
				float4 color71_g43448 = IsGammaSpace() ? float4(0,0,0,0) : float4(0,0,0,0);
				float4 temp_output_115_0_g43448 = saturate( ( SAMPLE_TEXTURE2D( _TranslucencyMap, sampler_trilinear_repeat, OUT_UV213_g43431 ) / max( _TranslucencyThicknessFeather , 1E-05 ) ) );
				float4 lerpResult34_g43448 = lerp( color71_g43448 , temp_output_115_0_g43448 , _TranslucencyThickness);
				float4 m_Texture38_g43448 = lerpResult34_g43448;
				float temp_output_69_0_g43448 = ( 0.0 - 1.0 );
				float temp_output_22_0_g43448 = ( temp_output_115_0_g43448.r - 1.0 );
				float lerpResult66_g43448 = lerp( ( temp_output_69_0_g43448 / temp_output_22_0_g43448 ) , ( temp_output_22_0_g43448 / temp_output_69_0_g43448 ) , ( 0.7 + _TranslucencyThickness ));
				float4 temp_cast_30 = (saturate( lerpResult66_g43448 )).xxxx;
				float4 m_TextureInverted38_g43448 = temp_cast_30;
				float lerpResult30_g43448 = lerp( 0.0 , ( 5.0 - packedInput.ase_texcoord5.zw.x ) , _TranslucencyThickness);
				float4 temp_cast_31 = (lerpResult30_g43448).xxxx;
				float4 m_Baked38_g43448 = temp_cast_31;
				float4 localfloat4switch38_g43448 = float4switch38_g43448( m_switch38_g43448 , m_Texture38_g43448 , m_TextureInverted38_g43448 , m_Baked38_g43448 );
				float4 lerpResult119_g43448 = lerp( float4( 0,0,0,0 ) , ( saturate( ( pow( saturate( max( dotResult74_g43448 , 0.0 ) ) , _SubsurfacePower ) * ( 1.0 - _SubsurfaceIntensityHDRP ) ) ) + ( localfloat4switch38_g43448 * ( 1.0 - _TranslucentScatteringHDRP ) ) ) , _EnableTranslucency);
				
				surfaceDescription.Albedo = ( localColorShift_Modefloat4switch364_g43432 + float4(0,0,0,0) ).xyz;
				surfaceDescription.Normal = temp_output_1610_30_g43431;
				surfaceDescription.BentNormal = local_BentNormal_Spacefloat3switch6_g43461;
				surfaceDescription.CoatMask = 0;
				surfaceDescription.Metallic = 0;

				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceDescription.Specular = 0;
				#endif

				surfaceDescription.Emission = 0;
				surfaceDescription.Smoothness = ( temp_output_1635_33_g43431 * Occlusion1628_g43431 ).x;
				surfaceDescription.Occlusion = saturate( lerpResult83_g43444 ).r;
				surfaceDescription.Alpha = ( Albedo_Alpha52_g43443 * OpacityMask42_g43443 );

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = _Cutoff;
				#endif

				#ifdef _ALPHATEST_SHADOW_ON
				surfaceDescription.AlphaClipThresholdShadow = _AlphaCutoffShadow;
				#endif

				surfaceDescription.AlphaClipThresholdDepthPrepass = 0.5;
				surfaceDescription.AlphaClipThresholdDepthPostpass = 0.5;

				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
				surfaceDescription.SpecularAAScreenSpaceVariance = lerpResult3_g43466;
				surfaceDescription.SpecularAAThreshold = lerpResult4_g43466;
				#endif

				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceDescription.SpecularOcclusion = 0;
				#endif

				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceDescription.Thickness = lerpResult119_g43448.x;
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
				surfaceDescription.DiffusionProfile = _DiffusionProfileHash;
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
			#define _MATERIAL_FEATURE_TRANSMISSION 1
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
			float4 _ColorShift_MaskMap_ST;
			float4 _Smoothness;
			float4 _Color;
			float _DoubleSidedGIMode;
			float _ColorShift_ShiftSaturation;
			float _ColorShift_MaskFuzziness;
			float _ColorShift_ShiftInfluence;
			half _NormalStrength;
			int _NormalMapSpace;
			half _NormalStrengthBent;
			int _SmoothnessSource;
			float _OcclusionStrengthAO;
			float _OcclusionSource;
			float _CustomCutoffAntialias;
			float _EnableCustomAntialias;
			float _GlancingClipMode;
			float _Cutoff;
			float _AlphaCutoffShadow;
			float _SpecularAAScreenSpaceVariance;
			float _EnableGeometricSpecularAA;
			float _SpecularAAThreshold;
			float _SubsurfaceDistortionHDRP;
			float _SubsurfacePower;
			float _SubsurfaceIntensityHDRP;
			int _TranslucencySourceHDRP;
			float _TranslucencyThicknessFeather;
			float _TranslucencyThickness;
			float _TranslucentScatteringHDRP;
			float _ColorShift_ShiftVariationRGB;
			float _ColorShift_ShiftVariation;
			float _ColorShift_WorldSpaceDistance;
			float _ColorShift_WorldSpaceOffset;
			half _EmissionFlags;
			float _TransparentWritingMotionVec;
			float _EnableBlendModePreserveSpecularLighting;
			float _AlphaToMaskInspectorValue;
			int _OpaqueCullMode;
			float _SmoothnessMax;
			float _SmoothnessMin;
			int _WindMode;
			int _WindType;
			float _GlobalWindInfluenceOther;
			float _LocalWindStrength;
			float _LocalRandomWindOffset;
			float _LocalWindPulse;
			float _LocalWindDirection;
			float _GlobalTurbulenceInfluence;
			float _LocalWindTurbulence;
			int _ColorShift_Mode;
			float _TilingX;
			float _TilingY;
			float _OffsetX;
			float _OffsetY;
			half _Brightness;
			int _ColorShift_MaskMode;
			float _ColorShift_NoiseScale;
			float _ColorShift_WorldSpaceNoiseShift;
			float _EnableTranslucency;
			float _DiffusionProfileHash;
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
			float _Global_Wind_Main_Turbulence;
			float _Global_Wind_Main_Fade_Bias;
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_trilinear_repeat);
			TEXTURE2D(_ColorShift_MaskMap);
			TEXTURE2D(_BumpMap);
			TEXTURE2D(_BentNormalMap);
			TEXTURE2D(_SmoothnessMap);
			TEXTURE2D(_OcclusionMap);
			TEXTURE2D(_TranslucencyMap);


			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_TANGENT
			#define ASE_NEEDS_FRAG_POSITION
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
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				float4 positionCS : SV_Position;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_color : COLOR;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};

			float4 mod289( float4 x )
			{
				return x - floor(x * (1.0 / 289.0)) * 289.0;
			}
			
			float4 perm( float4 x )
			{
				return mod289(((x * 34.0) + 1.0) * x);
			}
			
			float SimpleNoise3D( float3 p )
			{
				 float3 a = floor(p);
				    float3 d = p - a;
				    d = d * d * (3.0 - 2.0 * d);
				 float4 b = a.xxyy + float4(0.0, 1.0, 0.0, 1.0);
				    float4 k1 = perm(b.xyxy);
				 float4 k2 = perm(k1.xyxy + b.zzww);
				    float4 c = k2 + a.zzzz;
				    float4 k3 = perm(c);
				    float4 k4 = perm(c + 1.0);
				    float4 o1 = frac(k3 * (1.0 / 41.0));
				 float4 o2 = frac(k4 * (1.0 / 41.0));
				    float4 o3 = o2 * d.z + o1 * (1.0 - d.z);
				    float2 o4 = o3.yw * d.x + o3.xz * (1.0 - d.x);
				    return o4.y * d.y + o4.x * (1.0 - d.y);
			}
			
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
			
			float3 Wind_Typefloat3switch2439_g3466( int m_switch, float3 m_Leaf, float3 m_Palm, float3 m_Grass, float3 m_Simple, float3 m_Ivy )
			{
				if(m_switch ==0)
					return m_Leaf;
				else if(m_switch ==1)
					return m_Palm;
				else if(m_switch ==2)
					return m_Grass;
				else if(m_switch ==3)
					return m_Simple;
				else if(m_switch ==4)
					return m_Ivy;
				else
				return float3(0,0,0);
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
			
			float3 Wind_Fadefloat3switch3050_g3466( int m_switch, float3 m_Off, float3 m_ActiveFadeOut, float3 m_ActiveFadeIn )
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
			
			float3 HSVToRGB( float3 c )
			{
				float4 K = float4( 1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0 );
				float3 p = abs( frac( c.xxx + K.xyz ) * 6.0 - K.www );
				return c.z * lerp( K.xxx, saturate( p - K.xxx ), c.y );
			}
			
			float ColorShift_Modefloatswitch168_g43432( int m_switch, float m_Off, float m_ObjectSpace, float m_WorldSpace, float m_VertexColor, float m_VertexNormal )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_ObjectSpace;
				else if(m_switch ==2)
					return m_WorldSpace;
				else if(m_switch ==3)
					return m_VertexColor;
				else if(m_switch ==4)
					return m_VertexNormal;
				else
				return float(0);
			}
			
			float3 RGBToHSV(float3 c)
			{
				float4 K = float4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
				float4 p = lerp( float4( c.bg, K.wz ), float4( c.gb, K.xy ), step( c.b, c.g ) );
				float4 q = lerp( float4( p.xyw, c.r ), float4( c.r, p.yzx ), step( p.x, c.r ) );
				float d = q.x - min( q.w, q.y );
				float e = 1.0e-10;
				return float3( abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
			}
			float4 ColorShift_Maskfloat4switch313_g43432( int m_switch, float4 m_Off, float4 m_Active, float4 m_ActiveInverted )
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
			
			float4 ColorShift_Modefloat4switch364_g43432( int m_switch, float4 m_Off, float4 m_ObjectSpace, float4 m_WorldSpace, float4 m_VertexColor, float4 m_VertexNormal )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_ObjectSpace;
				else if(m_switch ==2)
					return m_WorldSpace;
				else if(m_switch ==3)
					return m_VertexColor;
				else if(m_switch ==4)
					return m_VertexNormal;
				else
				return float4(0,0,0,0);
			}
			
			float3 ASEUnpackNormalRGB(float4 PackedNormal, float Scale = 1.0 )
			{
				float3 normal;
				normal.xyz = PackedNormal.rgb * 2.0 - 1.0;
				normal.xy *= Scale;
				return normal;
			}
			
			float3 _BentNormal_Spacefloat3switch6_g43461( int m_switch, float3 m_TangentSpace, float3 m_ObjectSpace )
			{
				if(m_switch ==0)
					return m_TangentSpace;
				else if(m_switch ==1)
					return m_ObjectSpace;
				else
				return float3(0,0,0);
			}
			
			float4 SmoothnessTypefloat4switch215_g43455( int m_switch, float4 m_Smoothness, float4 m_Roughness, float4 m_Geometric )
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
			
			float4 float4switch38_g43448( int m_switch, float4 m_Texture, float4 m_TextureInverted, float4 m_Baked )
			{
				if(m_switch ==0)
					return m_Texture;
				else if(m_switch ==1)
					return m_TextureInverted;
				else if(m_switch ==2)
					return m_Baked;
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

				int m_switch3050_g3466 = _Global_Wind_Main_Fade_Enabled;
				int m_switch2453_g3466 = _WindMode;
				float3 m_Off2453_g3466 = float3(0,0,0);
				int m_switch2439_g3466 = _WindType;
				float3 VERTEX_POSITION_MATRIX2352_g3466 = mul( GetObjectToWorldMatrix(), float4( inputMesh.positionOS , 0.0 ) ).xyz;
				float3 break2265_g3466 = VERTEX_POSITION_MATRIX2352_g3466;
				int WIND_MODE2462_g3466 = _WindMode;
				int m_switch2458_g3466 = WIND_MODE2462_g3466;
				float m_Off2458_g3466 = 1.0;
				float m_Global2458_g3466 = ( _GlobalWindInfluenceOther * _Global_Wind_Main_Intensity );
				float m_Local2458_g3466 = _LocalWindStrength;
				float localWind_Globalfloatswitch2458_g3466 = Wind_Globalfloatswitch( m_switch2458_g3466 , m_Off2458_g3466 , m_Global2458_g3466 , m_Local2458_g3466 );
				float _WIND_STRENGHT2400_g3466 = localWind_Globalfloatswitch2458_g3466;
				int m_switch2468_g3466 = WIND_MODE2462_g3466;
				float m_Off2468_g3466 = 1.0;
				float m_Global2468_g3466 = _Global_Wind_Main_RandomOffset;
				float m_Local2468_g3466 = _LocalRandomWindOffset;
				float localWind_Globalfloatswitch2468_g3466 = Wind_Globalfloatswitch( m_switch2468_g3466 , m_Off2468_g3466 , m_Global2468_g3466 , m_Local2468_g3466 );
				float4 transform3073_g3466 = mul(GetObjectToWorldMatrix(),float4( 0,0,0,1 ));
				transform3073_g3466.xyz = GetAbsolutePositionWS((transform3073_g3466).xyz);
				float2 appendResult2307_g3466 = (float2(transform3073_g3466.x , transform3073_g3466.z));
				float dotResult2341_g3466 = dot( appendResult2307_g3466 , float2( 12.9898,78.233 ) );
				float lerpResult2238_g3466 = lerp( 0.8 , ( ( localWind_Globalfloatswitch2468_g3466 / 2.0 ) + 0.9 ) , frac( ( sin( dotResult2341_g3466 ) * 43758.55 ) ));
				float _WIND_RANDOM_OFFSET2244_g3466 = ( ( _TimeParameters.x * 0.05 ) * lerpResult2238_g3466 );
				float _WIND_TUBULENCE_RANDOM2274_g3466 = ( sin( ( ( _WIND_RANDOM_OFFSET2244_g3466 * 40.0 ) - ( VERTEX_POSITION_MATRIX2352_g3466.z / 15.0 ) ) ) * 0.5 );
				int m_switch2312_g3466 = WIND_MODE2462_g3466;
				float m_Off2312_g3466 = 1.0;
				float m_Global2312_g3466 = _Global_Wind_Main_Pulse;
				float m_Local2312_g3466 = _LocalWindPulse;
				float localWind_Globalfloatswitch2312_g3466 = Wind_Globalfloatswitch( m_switch2312_g3466 , m_Off2312_g3466 , m_Global2312_g3466 , m_Local2312_g3466 );
				float _WIND_PULSE2421_g3466 = localWind_Globalfloatswitch2312_g3466;
				float FUNC_Angle2470_g3466 = ( _WIND_STRENGHT2400_g3466 * ( 1.0 + sin( ( ( ( ( _WIND_RANDOM_OFFSET2244_g3466 * 2.0 ) + _WIND_TUBULENCE_RANDOM2274_g3466 ) - ( VERTEX_POSITION_MATRIX2352_g3466.z / 50.0 ) ) - ( inputMesh.ase_color.r / 20.0 ) ) ) ) * sqrt( inputMesh.ase_color.r ) * _WIND_PULSE2421_g3466 );
				float FUNC_Angle_SinA2424_g3466 = sin( FUNC_Angle2470_g3466 );
				float FUNC_Angle_CosA2362_g3466 = cos( FUNC_Angle2470_g3466 );
				int m_switch2456_g3466 = WIND_MODE2462_g3466;
				float m_Off2456_g3466 = 1.0;
				float m_Global2456_g3466 = _Global_Wind_Main_Direction;
				float m_Local2456_g3466 = _LocalWindDirection;
				float localWind_Globalfloatswitch2456_g3466 = Wind_Globalfloatswitch( m_switch2456_g3466 , m_Off2456_g3466 , m_Global2456_g3466 , m_Local2456_g3466 );
				float _WindDirection2249_g3466 = localWind_Globalfloatswitch2456_g3466;
				float2 localDirectionalEquation2249_g3466 = DirectionalEquation( _WindDirection2249_g3466 );
				float2 break2469_g3466 = localDirectionalEquation2249_g3466;
				float _WIND_DIRECTION_X2418_g3466 = break2469_g3466.x;
				float lerpResult2258_g3466 = lerp( break2265_g3466.x , ( ( break2265_g3466.y * FUNC_Angle_SinA2424_g3466 ) + ( break2265_g3466.x * FUNC_Angle_CosA2362_g3466 ) ) , _WIND_DIRECTION_X2418_g3466);
				float3 break2340_g3466 = VERTEX_POSITION_MATRIX2352_g3466;
				float3 break2233_g3466 = VERTEX_POSITION_MATRIX2352_g3466;
				float _WIND_DIRECTION_Y2416_g3466 = break2469_g3466.y;
				float lerpResult2275_g3466 = lerp( break2233_g3466.z , ( ( break2233_g3466.y * FUNC_Angle_SinA2424_g3466 ) + ( break2233_g3466.z * FUNC_Angle_CosA2362_g3466 ) ) , _WIND_DIRECTION_Y2416_g3466);
				float3 appendResult2235_g3466 = (float3(lerpResult2258_g3466 , ( ( break2340_g3466.y * FUNC_Angle_CosA2362_g3466 ) - ( break2340_g3466.z * FUNC_Angle_SinA2424_g3466 ) ) , lerpResult2275_g3466));
				float3 VERTEX_POSITION2282_g3466 = ( mul( GetWorldToObjectMatrix(), float4( appendResult2235_g3466 , 0.0 ) ).xyz - inputMesh.positionOS );
				float3 break2518_g3466 = VERTEX_POSITION2282_g3466;
				half FUNC_SinFunction2336_g3466 = sin( ( ( _WIND_RANDOM_OFFSET2244_g3466 * 200.0 * ( 0.2 + inputMesh.ase_color.g ) ) + ( inputMesh.ase_color.g * 10.0 ) + _WIND_TUBULENCE_RANDOM2274_g3466 + ( VERTEX_POSITION_MATRIX2352_g3466.z / 2.0 ) ) );
				int m_switch2326_g3466 = WIND_MODE2462_g3466;
				float m_Off2326_g3466 = 1.0;
				float m_Global2326_g3466 = ( _GlobalTurbulenceInfluence * _Global_Wind_Main_Turbulence );
				float m_Local2326_g3466 = _LocalWindTurbulence;
				float localWind_Globalfloatswitch2326_g3466 = Wind_Globalfloatswitch( m_switch2326_g3466 , m_Off2326_g3466 , m_Global2326_g3466 , m_Local2326_g3466 );
				float _WIND_TUBULENCE2442_g3466 = localWind_Globalfloatswitch2326_g3466;
				float3 appendResult2480_g3466 = (float3(break2518_g3466.x , ( break2518_g3466.y + ( FUNC_SinFunction2336_g3466 * inputMesh.ase_color.b * ( FUNC_Angle2470_g3466 + ( _WIND_STRENGHT2400_g3466 / 200.0 ) ) * _WIND_TUBULENCE2442_g3466 ) ) , break2518_g3466.z));
				float3 VERTEX_LEAF2396_g3466 = appendResult2480_g3466;
				float3 m_Leaf2439_g3466 = VERTEX_LEAF2396_g3466;
				float3 VERTEX_PALM2310_g3466 = ( ( FUNC_SinFunction2336_g3466 * inputMesh.ase_color.b * ( FUNC_Angle2470_g3466 + ( _WIND_STRENGHT2400_g3466 / 200.0 ) ) * _WIND_TUBULENCE2442_g3466 ) + VERTEX_POSITION2282_g3466 );
				float3 m_Palm2439_g3466 = VERTEX_PALM2310_g3466;
				float3 break2486_g3466 = VERTEX_POSITION2282_g3466;
				float temp_output_2514_0_g3466 = ( FUNC_SinFunction2336_g3466 * inputMesh.ase_color.b * ( FUNC_Angle2470_g3466 + ( _WIND_STRENGHT2400_g3466 / 200.0 ) ) );
				float lerpResult2482_g3466 = lerp( 0.0 , temp_output_2514_0_g3466 , _WIND_DIRECTION_X2418_g3466);
				float lerpResult2484_g3466 = lerp( 0.0 , temp_output_2514_0_g3466 , _WIND_DIRECTION_Y2416_g3466);
				float3 appendResult2489_g3466 = (float3(( break2486_g3466.x + lerpResult2482_g3466 ) , break2486_g3466.y , ( break2486_g3466.z + lerpResult2484_g3466 )));
				float3 VERTEX_GRASS2242_g3466 = appendResult2489_g3466;
				float3 m_Grass2439_g3466 = VERTEX_GRASS2242_g3466;
				float3 m_Simple2439_g3466 = VERTEX_POSITION2282_g3466;
				float clampResult2884_g3466 = clamp( ( _WIND_STRENGHT2400_g3466 - 0.95 ) , 0.0 , 1.0 );
				float3 break2708_g3466 = VERTEX_POSITION2282_g3466;
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				float3 break2718_g3466 = ase_worldPos;
				float temp_output_2690_0_g3466 = ( _WIND_RANDOM_OFFSET2244_g3466 * 25.0 );
				float clampResult2691_g3466 = clamp( 25.0 , 0.2 , 0.25 );
				float2 appendResult2694_g3466 = (float2(temp_output_2690_0_g3466 , ( temp_output_2690_0_g3466 / clampResult2691_g3466 )));
				float3 appendResult2706_g3466 = (float3(break2708_g3466.x , ( break2708_g3466.y + cos( ( ( ( break2718_g3466.x + break2718_g3466.y + break2718_g3466.z ) * 2.0 ) + appendResult2694_g3466 + FUNC_Angle2470_g3466 + _WIND_TUBULENCE2442_g3466 ) ) ).x , break2708_g3466.z));
				float3 temp_output_2613_0_g3466 = ( clampResult2884_g3466 * appendResult2706_g3466 );
				float3 VERTEX_IVY997_g3466 = ( ( ( cos( temp_output_2613_0_g3466 ) + ( -0.3193 * PI ) ) * inputMesh.normalOS * 0.2 * ( FUNC_SinFunction2336_g3466 * inputMesh.ase_color.b ) ) + ( sin( temp_output_2613_0_g3466 ) * cross( inputMesh.normalOS , inputMesh.tangentOS.xyz ) * 0.2 ) );
				float3 m_Ivy2439_g3466 = VERTEX_IVY997_g3466;
				float3 localWind_Typefloat3switch2439_g3466 = Wind_Typefloat3switch2439_g3466( m_switch2439_g3466 , m_Leaf2439_g3466 , m_Palm2439_g3466 , m_Grass2439_g3466 , m_Simple2439_g3466 , m_Ivy2439_g3466 );
				float3 m_Global2453_g3466 = localWind_Typefloat3switch2439_g3466;
				float3 m_Local2453_g3466 = localWind_Typefloat3switch2439_g3466;
				float3 localWind_Globalfloat3switch2453_g3466 = Wind_Globalfloat3switch( m_switch2453_g3466 , m_Off2453_g3466 , m_Global2453_g3466 , m_Local2453_g3466 );
				float3 m_Off3050_g3466 = localWind_Globalfloat3switch2453_g3466;
				float temp_output_3048_0_g3466 = saturate( pow( ( distance( _WorldSpaceCameraPos , ase_worldPos ) / _Global_Wind_Main_Fade_Bias ) , 5.0 ) );
				float3 m_ActiveFadeOut3050_g3466 = ( localWind_Globalfloat3switch2453_g3466 * ( 1.0 - temp_output_3048_0_g3466 ) );
				float3 m_ActiveFadeIn3050_g3466 = ( localWind_Globalfloat3switch2453_g3466 * temp_output_3048_0_g3466 );
				float3 localWind_Fadefloat3switch3050_g3466 = Wind_Fadefloat3switch3050_g3466( m_switch3050_g3466 , m_Off3050_g3466 , m_ActiveFadeOut3050_g3466 , m_ActiveFadeIn3050_g3466 );
				float3 temp_output_1234_0_g43431 = localWind_Fadefloat3switch3050_g3466;
				
				outputPackedVaryingsMeshToPS.ase_texcoord1.xyz = ase_worldPos;
				
				float3 ase_worldTangent = TransformObjectToWorldDir(inputMesh.tangentOS.xyz);
				outputPackedVaryingsMeshToPS.ase_texcoord3.xyz = ase_worldTangent;
				float3 ase_worldNormal = TransformObjectToWorldNormal(inputMesh.normalOS);
				outputPackedVaryingsMeshToPS.ase_texcoord4.xyz = ase_worldNormal;
				float ase_vertexTangentSign = inputMesh.tangentOS.w * unity_WorldTransformParams.w;
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				outputPackedVaryingsMeshToPS.ase_texcoord5.xyz = ase_worldBitangent;
				
				outputPackedVaryingsMeshToPS.ase_texcoord.xy = inputMesh.uv0.xy;
				outputPackedVaryingsMeshToPS.ase_texcoord2 = float4(inputMesh.positionOS,1);
				outputPackedVaryingsMeshToPS.ase_color = inputMesh.ase_color;
				outputPackedVaryingsMeshToPS.ase_normal = inputMesh.normalOS;
				outputPackedVaryingsMeshToPS.ase_texcoord.zw = inputMesh.ase_texcoord3.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord1.w = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord3.w = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord4.w = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord5.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = temp_output_1234_0_g43431;

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
				float4 ase_texcoord3 : TEXCOORD3;

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
				o.ase_texcoord3 = v.ase_texcoord3;
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
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
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
				int m_switch364_g43432 = _ColorShift_Mode;
				float2 appendResult168_g43431 = (float2(_TilingX , _TilingY));
				float2 appendResult167_g43431 = (float2(_OffsetX , _OffsetY));
				float2 texCoord2_g43454 = packedInput.ase_texcoord.xy * appendResult168_g43431 + appendResult167_g43431;
				float2 OUT_UV213_g43431 = texCoord2_g43454;
				float2 UV40_g43445 = OUT_UV213_g43431;
				float4 tex2DNode63_g43445 = SAMPLE_TEXTURE2D( _MainTex, sampler_trilinear_repeat, UV40_g43445 );
				float4 ALBEDO_RGBA1381_g43431 = tex2DNode63_g43445;
				float3 temp_output_3_0_g43431 = ( (_Color).rgb * (ALBEDO_RGBA1381_g43431).rgb * _Brightness );
				float3 temp_output_134_0_g43432 = temp_output_3_0_g43431;
				float4 m_Off364_g43432 = float4( temp_output_134_0_g43432 , 0.0 );
				int m_switch313_g43432 = _ColorShift_MaskMode;
				int MODE176_g43432 = _ColorShift_Mode;
				int m_switch168_g43432 = MODE176_g43432;
				float m_Off168_g43432 = 0.0;
				float m_ObjectSpace168_g43432 = ( _ColorShift_NoiseScale / 3 );
				float3 ase_worldPos = packedInput.ase_texcoord1.xyz;
				float3 p1_g43433 = ( ase_worldPos * _ColorShift_WorldSpaceNoiseShift );
				float localSimpleNoise3D1_g43433 = SimpleNoise3D( p1_g43433 );
				float4 transform374_g43432 = mul(GetObjectToWorldMatrix(),packedInput.ase_texcoord2);
				transform374_g43432.xyz = GetAbsolutePositionWS((transform374_g43432).xyz);
				float m_WorldSpace168_g43432 = ( ( localSimpleNoise3D1_g43433 / _ColorShift_NoiseScale ) - ( ( (transform374_g43432).w - _ColorShift_WorldSpaceOffset ) / _ColorShift_WorldSpaceDistance ) );
				float m_VertexColor168_g43432 = ( packedInput.ase_color.g - 0.5 );
				float m_VertexNormal168_g43432 = ( packedInput.ase_normal.y - 0.5 );
				float localColorShift_Modefloatswitch168_g43432 = ColorShift_Modefloatswitch168_g43432( m_switch168_g43432 , m_Off168_g43432 , m_ObjectSpace168_g43432 , m_WorldSpace168_g43432 , m_VertexColor168_g43432 , m_VertexNormal168_g43432 );
				float temp_output_112_0_g43432 = sin( ( _ColorShift_NoiseScale * PI ) );
				float3 ALBEDO_IN136_g43432 = temp_output_134_0_g43432;
				float2 appendResult120_g43432 = (float2(( (0.3 + (( 1.0 - temp_output_112_0_g43432 ) - 0.0) * (1.0 - 0.3) / (1.0 - 0.0)) * float4( ALBEDO_IN136_g43432 , 0.0 ).x ) , 0.0));
				float2 RGB146_g43432 = appendResult120_g43432;
				float3 hsvTorgb122_g43432 = RGBToHSV( float3( RGB146_g43432 ,  0.0 ) );
				float VALUE219_g43432 = temp_output_112_0_g43432;
				float3 hsvTorgb126_g43432 = HSVToRGB( float3(( ( saturate( localColorShift_Modefloatswitch168_g43432 ) * _ColorShift_ShiftVariation ) + _ColorShift_ShiftVariationRGB + hsvTorgb122_g43432 ).x,( _ColorShift_ShiftSaturation * hsvTorgb122_g43432.y ),( hsvTorgb122_g43432.z + ( VALUE219_g43432 / 40 ) )) );
				float4 m_Off313_g43432 = float4( hsvTorgb126_g43432 , 0.0 );
				float2 uv_ColorShift_MaskMap = packedInput.ase_texcoord.xy * _ColorShift_MaskMap_ST.xy + _ColorShift_MaskMap_ST.zw;
				float4 transform376_g43432 = mul(GetObjectToWorldMatrix(),float4( packedInput.ase_texcoord2.xyz , 0.0 ));
				transform376_g43432.xyz = GetAbsolutePositionWS((transform376_g43432).xyz);
				float4 temp_output_337_0_g43432 = saturate( ( 1.0 - ( ( SAMPLE_TEXTURE2D( _ColorShift_MaskMap, sampler_trilinear_repeat, uv_ColorShift_MaskMap ) * transform376_g43432 ) / max( _ColorShift_MaskFuzziness , 1E-05 ) ) ) );
				float3 lerpResult314_g43432 = lerp( hsvTorgb126_g43432 , ALBEDO_IN136_g43432 , temp_output_337_0_g43432.rgb);
				float4 m_Active313_g43432 = float4( lerpResult314_g43432 , 0.0 );
				float3 lerpResult311_g43432 = lerp( ALBEDO_IN136_g43432 , hsvTorgb126_g43432 , temp_output_337_0_g43432.rgb);
				float4 m_ActiveInverted313_g43432 = float4( lerpResult311_g43432 , 0.0 );
				float4 localColorShift_Maskfloat4switch313_g43432 = ColorShift_Maskfloat4switch313_g43432( m_switch313_g43432 , m_Off313_g43432 , m_Active313_g43432 , m_ActiveInverted313_g43432 );
				float4 lerpResult297_g43432 = lerp( float4( temp_output_134_0_g43432 , 0.0 ) , localColorShift_Maskfloat4switch313_g43432 , _ColorShift_ShiftInfluence);
				float4 m_ObjectSpace364_g43432 = lerpResult297_g43432;
				float4 m_WorldSpace364_g43432 = lerpResult297_g43432;
				float4 m_VertexColor364_g43432 = lerpResult297_g43432;
				float4 m_VertexNormal364_g43432 = lerpResult297_g43432;
				float4 localColorShift_Modefloat4switch364_g43432 = ColorShift_Modefloat4switch364_g43432( m_switch364_g43432 , m_Off364_g43432 , m_ObjectSpace364_g43432 , m_WorldSpace364_g43432 , m_VertexColor364_g43432 , m_VertexNormal364_g43432 );
				
				float4 NORMAL_RGB1382_g43431 = SAMPLE_TEXTURE2D( _BumpMap, sampler_trilinear_repeat, UV40_g43445 );
				float4 temp_output_1_0_g43450 = NORMAL_RGB1382_g43431;
				float temp_output_8_0_g43450 = _NormalStrength;
				float3 unpack52_g43450 = UnpackNormalScale( temp_output_1_0_g43450, temp_output_8_0_g43450 );
				unpack52_g43450.z = lerp( 1, unpack52_g43450.z, saturate(temp_output_8_0_g43450) );
				float3 temp_output_1519_59_g43431 = unpack52_g43450;
				float3 NORMAL_IN42_g43456 = temp_output_1519_59_g43431;
				float3 temp_output_1610_30_g43431 = NORMAL_IN42_g43456;
				
				int m_switch6_g43461 = _NormalMapSpace;
				float2 texCoord16_g43461 = packedInput.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float4 temp_output_1_0_g43463 = SAMPLE_TEXTURE2D( _BentNormalMap, sampler_trilinear_repeat, texCoord16_g43461 );
				float temp_output_8_0_g43463 = _NormalStrengthBent;
				float3 unpack52_g43463 = UnpackNormalScale( temp_output_1_0_g43463, temp_output_8_0_g43463 );
				unpack52_g43463.z = lerp( 1, unpack52_g43463.z, saturate(temp_output_8_0_g43463) );
				float3 m_TangentSpace6_g43461 = unpack52_g43463;
				float temp_output_74_0_g43463 = ( 1.0 - temp_output_8_0_g43463 );
				float3 m_ObjectSpace6_g43461 = ASEUnpackNormalRGB(temp_output_1_0_g43463,temp_output_74_0_g43463);
				float3 local_BentNormal_Spacefloat3switch6_g43461 = _BentNormal_Spacefloat3switch6_g43461( m_switch6_g43461 , m_TangentSpace6_g43461 , m_ObjectSpace6_g43461 );
				
				int temp_output_223_0_g43455 = _SmoothnessSource;
				int m_switch215_g43455 = temp_output_223_0_g43455;
				float4 MASK_G158_g43431 = SAMPLE_TEXTURE2D( _SmoothnessMap, sampler_trilinear_repeat, UV40_g43445 );
				float4 temp_cast_16 = (_SmoothnessMin).xxxx;
				float4 temp_cast_17 = (_SmoothnessMax).xxxx;
				float4 temp_output_216_0_g43455 = (temp_cast_16 + (MASK_G158_g43431 - float4( 0,0,0,0 )) * (temp_cast_17 - temp_cast_16) / (float4( 1,1,1,1 ) - float4( 0,0,0,0 )));
				float4 m_Smoothness215_g43455 = temp_output_216_0_g43455;
				float4 temp_cast_18 = (_SmoothnessMin).xxxx;
				float4 temp_cast_19 = (_SmoothnessMax).xxxx;
				float4 temp_output_214_0_g43455 = ( 1.0 - temp_output_216_0_g43455 );
				float4 m_Roughness215_g43455 = temp_output_214_0_g43455;
				float4 temp_cast_20 = (_SmoothnessMin).xxxx;
				float4 temp_cast_21 = (_SmoothnessMax).xxxx;
				float3 NORMAL_OUT1491_g43431 = temp_output_1610_30_g43431;
				float3 ase_worldTangent = packedInput.ase_texcoord3.xyz;
				float3 ase_worldNormal = packedInput.ase_texcoord4.xyz;
				float3 ase_worldBitangent = packedInput.ase_texcoord5.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal1608_g43431 = NORMAL_OUT1491_g43431;
				float3 worldNormal1608_g43431 = normalize( float3(dot(tanToWorld0,tanNormal1608_g43431), dot(tanToWorld1,tanNormal1608_g43431), dot(tanToWorld2,tanNormal1608_g43431)) );
				float3 temp_output_4_0_g43455 = worldNormal1608_g43431;
				float3 temp_output_178_0_g43455 = ddx( temp_output_4_0_g43455 );
				float dotResult195_g43455 = dot( temp_output_178_0_g43455 , temp_output_178_0_g43455 );
				float3 temp_output_175_0_g43455 = ddy( temp_output_4_0_g43455 );
				float dotResult201_g43455 = dot( temp_output_175_0_g43455 , temp_output_175_0_g43455 );
				float ALBEDO_R172_g43431 = tex2DNode63_g43445.r;
				float4 temp_cast_22 = (ALBEDO_R172_g43431).xxxx;
				float4 m_Geometric215_g43455 = ( sqrt( saturate( ( temp_output_216_0_g43455 + ( ( dotResult195_g43455 + dotResult201_g43455 ) * 2.0 ) ) ) ) * ( 1.0 - temp_cast_22 ) );
				float4 localSmoothnessTypefloat4switch215_g43455 = SmoothnessTypefloat4switch215_g43455( m_switch215_g43455 , m_Smoothness215_g43455 , m_Roughness215_g43455 , m_Geometric215_g43455 );
				float4 temp_output_1635_33_g43431 = localSmoothnessTypefloat4switch215_g43455;
				float4 PBR_Occlusion1712_g43431 = SAMPLE_TEXTURE2D( _OcclusionMap, sampler_trilinear_repeat, UV40_g43445 );
				float temp_output_16_0_g43444 = _OcclusionStrengthAO;
				float temp_output_65_0_g43444 = ( 1.0 - temp_output_16_0_g43444 );
				float3 appendResult69_g43444 = (float3(temp_output_65_0_g43444 , temp_output_65_0_g43444 , temp_output_65_0_g43444));
				float4 color77_g43444 = IsGammaSpace() ? float4(1,1,1,1) : float4(1,1,1,1);
				float4 temp_cast_25 = (packedInput.ase_color.a).xxxx;
				float4 lerpResult75_g43444 = lerp( color77_g43444 , temp_cast_25 , temp_output_16_0_g43444);
				float4 lerpResult83_g43444 = lerp( float4( ( ( ( (PBR_Occlusion1712_g43431).xyz - float3( 0.5,0.5,0.5 ) ) * temp_output_16_0_g43444 ) + appendResult69_g43444 ) , 0.0 ) , lerpResult75_g43444 , _OcclusionSource);
				float4 Occlusion1628_g43431 = saturate( lerpResult83_g43444 );
				
				float ALBEDO_A926_g43431 = tex2DNode63_g43445.a;
				float temp_output_1_0_g43439 = ALBEDO_A926_g43431;
				float temp_output_6_0_g43439 = ( step( _CustomCutoffAntialias , temp_output_1_0_g43439 ) - step( temp_output_1_0_g43439 , _CustomCutoffAntialias ) );
				float lerpResult10_g43439 = lerp( temp_output_1_0_g43439 , saturate( ( temp_output_6_0_g43439 / fwidth( temp_output_6_0_g43439 ) ) ) , _EnableCustomAntialias);
				float Albedo_Alpha52_g43443 = lerpResult10_g43439;
				float3 normalizeResult38_g43443 = normalize( cross( ddx( ase_worldPos ) , ddy( ase_worldPos ) ) );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult35_g43443 = dot( normalizeResult38_g43443 , ase_worldViewDir );
				float temp_output_32_0_g43443 = ( 1.0 - abs( dotResult35_g43443 ) );
				float lerpResult67_g43443 = lerp( 1.0 , ( 1.0 - ( temp_output_32_0_g43443 * temp_output_32_0_g43443 ) ) , _GlancingClipMode);
				float OpacityMask42_g43443 = lerpResult67_g43443;
				
				float lerpResult3_g43466 = lerp( 0.0 , _SpecularAAScreenSpaceVariance , _EnableGeometricSpecularAA);
				
				float lerpResult4_g43466 = lerp( 0.0 , _SpecularAAThreshold , _EnableGeometricSpecularAA);
				
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 tanNormal1607_g43431 = NORMAL_OUT1491_g43431;
				float3 worldNormal1607_g43431 = float3(dot(tanToWorld0,tanNormal1607_g43431), dot(tanToWorld1,tanNormal1607_g43431), dot(tanToWorld2,tanNormal1607_g43431));
				float3 temp_output_68_0_g43448 = ( worldNormal1607_g43431 * ( 1.0 - _SubsurfaceDistortionHDRP ) );
				float3 normalizeResult63_g43448 = normalize( ( -( -_DirectionalLightDatas[0].forward + temp_output_68_0_g43448 ) * temp_output_68_0_g43448 ) );
				float dotResult74_g43448 = dot( ase_worldViewDir , normalizeResult63_g43448 );
				int m_switch38_g43448 = _TranslucencySourceHDRP;
				float4 color71_g43448 = IsGammaSpace() ? float4(0,0,0,0) : float4(0,0,0,0);
				float4 temp_output_115_0_g43448 = saturate( ( SAMPLE_TEXTURE2D( _TranslucencyMap, sampler_trilinear_repeat, OUT_UV213_g43431 ) / max( _TranslucencyThicknessFeather , 1E-05 ) ) );
				float4 lerpResult34_g43448 = lerp( color71_g43448 , temp_output_115_0_g43448 , _TranslucencyThickness);
				float4 m_Texture38_g43448 = lerpResult34_g43448;
				float temp_output_69_0_g43448 = ( 0.0 - 1.0 );
				float temp_output_22_0_g43448 = ( temp_output_115_0_g43448.r - 1.0 );
				float lerpResult66_g43448 = lerp( ( temp_output_69_0_g43448 / temp_output_22_0_g43448 ) , ( temp_output_22_0_g43448 / temp_output_69_0_g43448 ) , ( 0.7 + _TranslucencyThickness ));
				float4 temp_cast_30 = (saturate( lerpResult66_g43448 )).xxxx;
				float4 m_TextureInverted38_g43448 = temp_cast_30;
				float lerpResult30_g43448 = lerp( 0.0 , ( 5.0 - packedInput.ase_texcoord.zw.x ) , _TranslucencyThickness);
				float4 temp_cast_31 = (lerpResult30_g43448).xxxx;
				float4 m_Baked38_g43448 = temp_cast_31;
				float4 localfloat4switch38_g43448 = float4switch38_g43448( m_switch38_g43448 , m_Texture38_g43448 , m_TextureInverted38_g43448 , m_Baked38_g43448 );
				float4 lerpResult119_g43448 = lerp( float4( 0,0,0,0 ) , ( saturate( ( pow( saturate( max( dotResult74_g43448 , 0.0 ) ) , _SubsurfacePower ) * ( 1.0 - _SubsurfaceIntensityHDRP ) ) ) + ( localfloat4switch38_g43448 * ( 1.0 - _TranslucentScatteringHDRP ) ) ) , _EnableTranslucency);
				
				surfaceDescription.Albedo = ( localColorShift_Modefloat4switch364_g43432 + float4(0,0,0,0) ).xyz;
				surfaceDescription.Normal = temp_output_1610_30_g43431;
				surfaceDescription.BentNormal = local_BentNormal_Spacefloat3switch6_g43461;
				surfaceDescription.CoatMask = 0;
				surfaceDescription.Metallic = 0;

				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceDescription.Specular = 0;
				#endif

				surfaceDescription.Emission = 0;
				surfaceDescription.Smoothness = ( temp_output_1635_33_g43431 * Occlusion1628_g43431 ).x;
				surfaceDescription.Occlusion = saturate( lerpResult83_g43444 ).r;
				surfaceDescription.Alpha = ( Albedo_Alpha52_g43443 * OpacityMask42_g43443 );

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = _Cutoff;
				#endif

				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
				surfaceDescription.SpecularAAScreenSpaceVariance = lerpResult3_g43466;
				surfaceDescription.SpecularAAThreshold = lerpResult4_g43466;
				#endif

				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceDescription.SpecularOcclusion = 0;
				#endif

				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceDescription.Thickness = lerpResult119_g43448.x;
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
				surfaceDescription.DiffusionProfile = _DiffusionProfileHash;
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
			#define _MATERIAL_FEATURE_TRANSMISSION 1
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
			float4 _ColorShift_MaskMap_ST;
			float4 _Smoothness;
			float4 _Color;
			float _DoubleSidedGIMode;
			float _ColorShift_ShiftSaturation;
			float _ColorShift_MaskFuzziness;
			float _ColorShift_ShiftInfluence;
			half _NormalStrength;
			int _NormalMapSpace;
			half _NormalStrengthBent;
			int _SmoothnessSource;
			float _OcclusionStrengthAO;
			float _OcclusionSource;
			float _CustomCutoffAntialias;
			float _EnableCustomAntialias;
			float _GlancingClipMode;
			float _Cutoff;
			float _AlphaCutoffShadow;
			float _SpecularAAScreenSpaceVariance;
			float _EnableGeometricSpecularAA;
			float _SpecularAAThreshold;
			float _SubsurfaceDistortionHDRP;
			float _SubsurfacePower;
			float _SubsurfaceIntensityHDRP;
			int _TranslucencySourceHDRP;
			float _TranslucencyThicknessFeather;
			float _TranslucencyThickness;
			float _TranslucentScatteringHDRP;
			float _ColorShift_ShiftVariationRGB;
			float _ColorShift_ShiftVariation;
			float _ColorShift_WorldSpaceDistance;
			float _ColorShift_WorldSpaceOffset;
			half _EmissionFlags;
			float _TransparentWritingMotionVec;
			float _EnableBlendModePreserveSpecularLighting;
			float _AlphaToMaskInspectorValue;
			int _OpaqueCullMode;
			float _SmoothnessMax;
			float _SmoothnessMin;
			int _WindMode;
			int _WindType;
			float _GlobalWindInfluenceOther;
			float _LocalWindStrength;
			float _LocalRandomWindOffset;
			float _LocalWindPulse;
			float _LocalWindDirection;
			float _GlobalTurbulenceInfluence;
			float _LocalWindTurbulence;
			int _ColorShift_Mode;
			float _TilingX;
			float _TilingY;
			float _OffsetX;
			float _OffsetY;
			half _Brightness;
			int _ColorShift_MaskMode;
			float _ColorShift_NoiseScale;
			float _ColorShift_WorldSpaceNoiseShift;
			float _EnableTranslucency;
			float _DiffusionProfileHash;
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
			float _Global_Wind_Main_Turbulence;
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
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_RELATIVE_WORLD_POS
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
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
				float4 ase_tangent : TANGENT;
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

			float4 mod289( float4 x )
			{
				return x - floor(x * (1.0 / 289.0)) * 289.0;
			}
			
			float4 perm( float4 x )
			{
				return mod289(((x * 34.0) + 1.0) * x);
			}
			
			float SimpleNoise3D( float3 p )
			{
				 float3 a = floor(p);
				    float3 d = p - a;
				    d = d * d * (3.0 - 2.0 * d);
				 float4 b = a.xxyy + float4(0.0, 1.0, 0.0, 1.0);
				    float4 k1 = perm(b.xyxy);
				 float4 k2 = perm(k1.xyxy + b.zzww);
				    float4 c = k2 + a.zzzz;
				    float4 k3 = perm(c);
				    float4 k4 = perm(c + 1.0);
				    float4 o1 = frac(k3 * (1.0 / 41.0));
				 float4 o2 = frac(k4 * (1.0 / 41.0));
				    float4 o3 = o2 * d.z + o1 * (1.0 - d.z);
				    float2 o4 = o3.yw * d.x + o3.xz * (1.0 - d.x);
				    return o4.y * d.y + o4.x * (1.0 - d.y);
			}
			
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
			
			float3 Wind_Typefloat3switch2439_g3466( int m_switch, float3 m_Leaf, float3 m_Palm, float3 m_Grass, float3 m_Simple, float3 m_Ivy )
			{
				if(m_switch ==0)
					return m_Leaf;
				else if(m_switch ==1)
					return m_Palm;
				else if(m_switch ==2)
					return m_Grass;
				else if(m_switch ==3)
					return m_Simple;
				else if(m_switch ==4)
					return m_Ivy;
				else
				return float3(0,0,0);
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
			
			float3 Wind_Fadefloat3switch3050_g3466( int m_switch, float3 m_Off, float3 m_ActiveFadeOut, float3 m_ActiveFadeIn )
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

				int m_switch3050_g3466 = _Global_Wind_Main_Fade_Enabled;
				int m_switch2453_g3466 = _WindMode;
				float3 m_Off2453_g3466 = float3(0,0,0);
				int m_switch2439_g3466 = _WindType;
				float3 VERTEX_POSITION_MATRIX2352_g3466 = mul( GetObjectToWorldMatrix(), float4( inputMesh.positionOS , 0.0 ) ).xyz;
				float3 break2265_g3466 = VERTEX_POSITION_MATRIX2352_g3466;
				int WIND_MODE2462_g3466 = _WindMode;
				int m_switch2458_g3466 = WIND_MODE2462_g3466;
				float m_Off2458_g3466 = 1.0;
				float m_Global2458_g3466 = ( _GlobalWindInfluenceOther * _Global_Wind_Main_Intensity );
				float m_Local2458_g3466 = _LocalWindStrength;
				float localWind_Globalfloatswitch2458_g3466 = Wind_Globalfloatswitch( m_switch2458_g3466 , m_Off2458_g3466 , m_Global2458_g3466 , m_Local2458_g3466 );
				float _WIND_STRENGHT2400_g3466 = localWind_Globalfloatswitch2458_g3466;
				int m_switch2468_g3466 = WIND_MODE2462_g3466;
				float m_Off2468_g3466 = 1.0;
				float m_Global2468_g3466 = _Global_Wind_Main_RandomOffset;
				float m_Local2468_g3466 = _LocalRandomWindOffset;
				float localWind_Globalfloatswitch2468_g3466 = Wind_Globalfloatswitch( m_switch2468_g3466 , m_Off2468_g3466 , m_Global2468_g3466 , m_Local2468_g3466 );
				float4 transform3073_g3466 = mul(GetObjectToWorldMatrix(),float4( 0,0,0,1 ));
				transform3073_g3466.xyz = GetAbsolutePositionWS((transform3073_g3466).xyz);
				float2 appendResult2307_g3466 = (float2(transform3073_g3466.x , transform3073_g3466.z));
				float dotResult2341_g3466 = dot( appendResult2307_g3466 , float2( 12.9898,78.233 ) );
				float lerpResult2238_g3466 = lerp( 0.8 , ( ( localWind_Globalfloatswitch2468_g3466 / 2.0 ) + 0.9 ) , frac( ( sin( dotResult2341_g3466 ) * 43758.55 ) ));
				float _WIND_RANDOM_OFFSET2244_g3466 = ( ( _TimeParameters.x * 0.05 ) * lerpResult2238_g3466 );
				float _WIND_TUBULENCE_RANDOM2274_g3466 = ( sin( ( ( _WIND_RANDOM_OFFSET2244_g3466 * 40.0 ) - ( VERTEX_POSITION_MATRIX2352_g3466.z / 15.0 ) ) ) * 0.5 );
				int m_switch2312_g3466 = WIND_MODE2462_g3466;
				float m_Off2312_g3466 = 1.0;
				float m_Global2312_g3466 = _Global_Wind_Main_Pulse;
				float m_Local2312_g3466 = _LocalWindPulse;
				float localWind_Globalfloatswitch2312_g3466 = Wind_Globalfloatswitch( m_switch2312_g3466 , m_Off2312_g3466 , m_Global2312_g3466 , m_Local2312_g3466 );
				float _WIND_PULSE2421_g3466 = localWind_Globalfloatswitch2312_g3466;
				float FUNC_Angle2470_g3466 = ( _WIND_STRENGHT2400_g3466 * ( 1.0 + sin( ( ( ( ( _WIND_RANDOM_OFFSET2244_g3466 * 2.0 ) + _WIND_TUBULENCE_RANDOM2274_g3466 ) - ( VERTEX_POSITION_MATRIX2352_g3466.z / 50.0 ) ) - ( inputMesh.ase_color.r / 20.0 ) ) ) ) * sqrt( inputMesh.ase_color.r ) * _WIND_PULSE2421_g3466 );
				float FUNC_Angle_SinA2424_g3466 = sin( FUNC_Angle2470_g3466 );
				float FUNC_Angle_CosA2362_g3466 = cos( FUNC_Angle2470_g3466 );
				int m_switch2456_g3466 = WIND_MODE2462_g3466;
				float m_Off2456_g3466 = 1.0;
				float m_Global2456_g3466 = _Global_Wind_Main_Direction;
				float m_Local2456_g3466 = _LocalWindDirection;
				float localWind_Globalfloatswitch2456_g3466 = Wind_Globalfloatswitch( m_switch2456_g3466 , m_Off2456_g3466 , m_Global2456_g3466 , m_Local2456_g3466 );
				float _WindDirection2249_g3466 = localWind_Globalfloatswitch2456_g3466;
				float2 localDirectionalEquation2249_g3466 = DirectionalEquation( _WindDirection2249_g3466 );
				float2 break2469_g3466 = localDirectionalEquation2249_g3466;
				float _WIND_DIRECTION_X2418_g3466 = break2469_g3466.x;
				float lerpResult2258_g3466 = lerp( break2265_g3466.x , ( ( break2265_g3466.y * FUNC_Angle_SinA2424_g3466 ) + ( break2265_g3466.x * FUNC_Angle_CosA2362_g3466 ) ) , _WIND_DIRECTION_X2418_g3466);
				float3 break2340_g3466 = VERTEX_POSITION_MATRIX2352_g3466;
				float3 break2233_g3466 = VERTEX_POSITION_MATRIX2352_g3466;
				float _WIND_DIRECTION_Y2416_g3466 = break2469_g3466.y;
				float lerpResult2275_g3466 = lerp( break2233_g3466.z , ( ( break2233_g3466.y * FUNC_Angle_SinA2424_g3466 ) + ( break2233_g3466.z * FUNC_Angle_CosA2362_g3466 ) ) , _WIND_DIRECTION_Y2416_g3466);
				float3 appendResult2235_g3466 = (float3(lerpResult2258_g3466 , ( ( break2340_g3466.y * FUNC_Angle_CosA2362_g3466 ) - ( break2340_g3466.z * FUNC_Angle_SinA2424_g3466 ) ) , lerpResult2275_g3466));
				float3 VERTEX_POSITION2282_g3466 = ( mul( GetWorldToObjectMatrix(), float4( appendResult2235_g3466 , 0.0 ) ).xyz - inputMesh.positionOS );
				float3 break2518_g3466 = VERTEX_POSITION2282_g3466;
				half FUNC_SinFunction2336_g3466 = sin( ( ( _WIND_RANDOM_OFFSET2244_g3466 * 200.0 * ( 0.2 + inputMesh.ase_color.g ) ) + ( inputMesh.ase_color.g * 10.0 ) + _WIND_TUBULENCE_RANDOM2274_g3466 + ( VERTEX_POSITION_MATRIX2352_g3466.z / 2.0 ) ) );
				int m_switch2326_g3466 = WIND_MODE2462_g3466;
				float m_Off2326_g3466 = 1.0;
				float m_Global2326_g3466 = ( _GlobalTurbulenceInfluence * _Global_Wind_Main_Turbulence );
				float m_Local2326_g3466 = _LocalWindTurbulence;
				float localWind_Globalfloatswitch2326_g3466 = Wind_Globalfloatswitch( m_switch2326_g3466 , m_Off2326_g3466 , m_Global2326_g3466 , m_Local2326_g3466 );
				float _WIND_TUBULENCE2442_g3466 = localWind_Globalfloatswitch2326_g3466;
				float3 appendResult2480_g3466 = (float3(break2518_g3466.x , ( break2518_g3466.y + ( FUNC_SinFunction2336_g3466 * inputMesh.ase_color.b * ( FUNC_Angle2470_g3466 + ( _WIND_STRENGHT2400_g3466 / 200.0 ) ) * _WIND_TUBULENCE2442_g3466 ) ) , break2518_g3466.z));
				float3 VERTEX_LEAF2396_g3466 = appendResult2480_g3466;
				float3 m_Leaf2439_g3466 = VERTEX_LEAF2396_g3466;
				float3 VERTEX_PALM2310_g3466 = ( ( FUNC_SinFunction2336_g3466 * inputMesh.ase_color.b * ( FUNC_Angle2470_g3466 + ( _WIND_STRENGHT2400_g3466 / 200.0 ) ) * _WIND_TUBULENCE2442_g3466 ) + VERTEX_POSITION2282_g3466 );
				float3 m_Palm2439_g3466 = VERTEX_PALM2310_g3466;
				float3 break2486_g3466 = VERTEX_POSITION2282_g3466;
				float temp_output_2514_0_g3466 = ( FUNC_SinFunction2336_g3466 * inputMesh.ase_color.b * ( FUNC_Angle2470_g3466 + ( _WIND_STRENGHT2400_g3466 / 200.0 ) ) );
				float lerpResult2482_g3466 = lerp( 0.0 , temp_output_2514_0_g3466 , _WIND_DIRECTION_X2418_g3466);
				float lerpResult2484_g3466 = lerp( 0.0 , temp_output_2514_0_g3466 , _WIND_DIRECTION_Y2416_g3466);
				float3 appendResult2489_g3466 = (float3(( break2486_g3466.x + lerpResult2482_g3466 ) , break2486_g3466.y , ( break2486_g3466.z + lerpResult2484_g3466 )));
				float3 VERTEX_GRASS2242_g3466 = appendResult2489_g3466;
				float3 m_Grass2439_g3466 = VERTEX_GRASS2242_g3466;
				float3 m_Simple2439_g3466 = VERTEX_POSITION2282_g3466;
				float clampResult2884_g3466 = clamp( ( _WIND_STRENGHT2400_g3466 - 0.95 ) , 0.0 , 1.0 );
				float3 break2708_g3466 = VERTEX_POSITION2282_g3466;
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				float3 break2718_g3466 = ase_worldPos;
				float temp_output_2690_0_g3466 = ( _WIND_RANDOM_OFFSET2244_g3466 * 25.0 );
				float clampResult2691_g3466 = clamp( 25.0 , 0.2 , 0.25 );
				float2 appendResult2694_g3466 = (float2(temp_output_2690_0_g3466 , ( temp_output_2690_0_g3466 / clampResult2691_g3466 )));
				float3 appendResult2706_g3466 = (float3(break2708_g3466.x , ( break2708_g3466.y + cos( ( ( ( break2718_g3466.x + break2718_g3466.y + break2718_g3466.z ) * 2.0 ) + appendResult2694_g3466 + FUNC_Angle2470_g3466 + _WIND_TUBULENCE2442_g3466 ) ) ).x , break2708_g3466.z));
				float3 temp_output_2613_0_g3466 = ( clampResult2884_g3466 * appendResult2706_g3466 );
				float3 VERTEX_IVY997_g3466 = ( ( ( cos( temp_output_2613_0_g3466 ) + ( -0.3193 * PI ) ) * inputMesh.normalOS * 0.2 * ( FUNC_SinFunction2336_g3466 * inputMesh.ase_color.b ) ) + ( sin( temp_output_2613_0_g3466 ) * cross( inputMesh.normalOS , inputMesh.ase_tangent.xyz ) * 0.2 ) );
				float3 m_Ivy2439_g3466 = VERTEX_IVY997_g3466;
				float3 localWind_Typefloat3switch2439_g3466 = Wind_Typefloat3switch2439_g3466( m_switch2439_g3466 , m_Leaf2439_g3466 , m_Palm2439_g3466 , m_Grass2439_g3466 , m_Simple2439_g3466 , m_Ivy2439_g3466 );
				float3 m_Global2453_g3466 = localWind_Typefloat3switch2439_g3466;
				float3 m_Local2453_g3466 = localWind_Typefloat3switch2439_g3466;
				float3 localWind_Globalfloat3switch2453_g3466 = Wind_Globalfloat3switch( m_switch2453_g3466 , m_Off2453_g3466 , m_Global2453_g3466 , m_Local2453_g3466 );
				float3 m_Off3050_g3466 = localWind_Globalfloat3switch2453_g3466;
				float temp_output_3048_0_g3466 = saturate( pow( ( distance( _WorldSpaceCameraPos , ase_worldPos ) / _Global_Wind_Main_Fade_Bias ) , 5.0 ) );
				float3 m_ActiveFadeOut3050_g3466 = ( localWind_Globalfloat3switch2453_g3466 * ( 1.0 - temp_output_3048_0_g3466 ) );
				float3 m_ActiveFadeIn3050_g3466 = ( localWind_Globalfloat3switch2453_g3466 * temp_output_3048_0_g3466 );
				float3 localWind_Fadefloat3switch3050_g3466 = Wind_Fadefloat3switch3050_g3466( m_switch3050_g3466 , m_Off3050_g3466 , m_ActiveFadeOut3050_g3466 , m_ActiveFadeIn3050_g3466 );
				float3 temp_output_1234_0_g43431 = localWind_Fadefloat3switch3050_g3466;
				
				outputPackedVaryingsMeshToPS.ase_texcoord1.xy = inputMesh.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord1.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = temp_output_1234_0_g43431;

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
				float4 ase_tangent : TANGENT;
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
				o.ase_tangent = v.ase_tangent;
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
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
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
				float2 appendResult168_g43431 = (float2(_TilingX , _TilingY));
				float2 appendResult167_g43431 = (float2(_OffsetX , _OffsetY));
				float2 texCoord2_g43454 = packedInput.ase_texcoord1.xy * appendResult168_g43431 + appendResult167_g43431;
				float2 OUT_UV213_g43431 = texCoord2_g43454;
				float2 UV40_g43445 = OUT_UV213_g43431;
				float4 tex2DNode63_g43445 = SAMPLE_TEXTURE2D( _MainTex, sampler_trilinear_repeat, UV40_g43445 );
				float ALBEDO_A926_g43431 = tex2DNode63_g43445.a;
				float temp_output_1_0_g43439 = ALBEDO_A926_g43431;
				float temp_output_6_0_g43439 = ( step( _CustomCutoffAntialias , temp_output_1_0_g43439 ) - step( temp_output_1_0_g43439 , _CustomCutoffAntialias ) );
				float lerpResult10_g43439 = lerp( temp_output_1_0_g43439 , saturate( ( temp_output_6_0_g43439 / fwidth( temp_output_6_0_g43439 ) ) ) , _EnableCustomAntialias);
				float Albedo_Alpha52_g43443 = lerpResult10_g43439;
				float3 ase_worldPos = GetAbsolutePositionWS( positionRWS );
				float3 normalizeResult38_g43443 = normalize( cross( ddx( ase_worldPos ) , ddy( ase_worldPos ) ) );
				float dotResult35_g43443 = dot( normalizeResult38_g43443 , V );
				float temp_output_32_0_g43443 = ( 1.0 - abs( dotResult35_g43443 ) );
				float lerpResult67_g43443 = lerp( 1.0 , ( 1.0 - ( temp_output_32_0_g43443 * temp_output_32_0_g43443 ) ) , _GlancingClipMode);
				float OpacityMask42_g43443 = lerpResult67_g43443;
				
				surfaceDescription.Alpha = ( Albedo_Alpha52_g43443 * OpacityMask42_g43443 );

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = _Cutoff;
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
			#define _MATERIAL_FEATURE_TRANSMISSION 1
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
			float4 _ColorShift_MaskMap_ST;
			float4 _Smoothness;
			float4 _Color;
			float _DoubleSidedGIMode;
			float _ColorShift_ShiftSaturation;
			float _ColorShift_MaskFuzziness;
			float _ColorShift_ShiftInfluence;
			half _NormalStrength;
			int _NormalMapSpace;
			half _NormalStrengthBent;
			int _SmoothnessSource;
			float _OcclusionStrengthAO;
			float _OcclusionSource;
			float _CustomCutoffAntialias;
			float _EnableCustomAntialias;
			float _GlancingClipMode;
			float _Cutoff;
			float _AlphaCutoffShadow;
			float _SpecularAAScreenSpaceVariance;
			float _EnableGeometricSpecularAA;
			float _SpecularAAThreshold;
			float _SubsurfaceDistortionHDRP;
			float _SubsurfacePower;
			float _SubsurfaceIntensityHDRP;
			int _TranslucencySourceHDRP;
			float _TranslucencyThicknessFeather;
			float _TranslucencyThickness;
			float _TranslucentScatteringHDRP;
			float _ColorShift_ShiftVariationRGB;
			float _ColorShift_ShiftVariation;
			float _ColorShift_WorldSpaceDistance;
			float _ColorShift_WorldSpaceOffset;
			half _EmissionFlags;
			float _TransparentWritingMotionVec;
			float _EnableBlendModePreserveSpecularLighting;
			float _AlphaToMaskInspectorValue;
			int _OpaqueCullMode;
			float _SmoothnessMax;
			float _SmoothnessMin;
			int _WindMode;
			int _WindType;
			float _GlobalWindInfluenceOther;
			float _LocalWindStrength;
			float _LocalRandomWindOffset;
			float _LocalWindPulse;
			float _LocalWindDirection;
			float _GlobalTurbulenceInfluence;
			float _LocalWindTurbulence;
			int _ColorShift_Mode;
			float _TilingX;
			float _TilingY;
			float _OffsetX;
			float _OffsetY;
			half _Brightness;
			int _ColorShift_MaskMode;
			float _ColorShift_NoiseScale;
			float _ColorShift_WorldSpaceNoiseShift;
			float _EnableTranslucency;
			float _DiffusionProfileHash;
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
			float _Global_Wind_Main_Turbulence;
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
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_RELATIVE_WORLD_POS
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
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
				float4 ase_tangent : TANGENT;
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

			float4 mod289( float4 x )
			{
				return x - floor(x * (1.0 / 289.0)) * 289.0;
			}
			
			float4 perm( float4 x )
			{
				return mod289(((x * 34.0) + 1.0) * x);
			}
			
			float SimpleNoise3D( float3 p )
			{
				 float3 a = floor(p);
				    float3 d = p - a;
				    d = d * d * (3.0 - 2.0 * d);
				 float4 b = a.xxyy + float4(0.0, 1.0, 0.0, 1.0);
				    float4 k1 = perm(b.xyxy);
				 float4 k2 = perm(k1.xyxy + b.zzww);
				    float4 c = k2 + a.zzzz;
				    float4 k3 = perm(c);
				    float4 k4 = perm(c + 1.0);
				    float4 o1 = frac(k3 * (1.0 / 41.0));
				 float4 o2 = frac(k4 * (1.0 / 41.0));
				    float4 o3 = o2 * d.z + o1 * (1.0 - d.z);
				    float2 o4 = o3.yw * d.x + o3.xz * (1.0 - d.x);
				    return o4.y * d.y + o4.x * (1.0 - d.y);
			}
			
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
			
			float3 Wind_Typefloat3switch2439_g3466( int m_switch, float3 m_Leaf, float3 m_Palm, float3 m_Grass, float3 m_Simple, float3 m_Ivy )
			{
				if(m_switch ==0)
					return m_Leaf;
				else if(m_switch ==1)
					return m_Palm;
				else if(m_switch ==2)
					return m_Grass;
				else if(m_switch ==3)
					return m_Simple;
				else if(m_switch ==4)
					return m_Ivy;
				else
				return float3(0,0,0);
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
			
			float3 Wind_Fadefloat3switch3050_g3466( int m_switch, float3 m_Off, float3 m_ActiveFadeOut, float3 m_ActiveFadeIn )
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

				int m_switch3050_g3466 = _Global_Wind_Main_Fade_Enabled;
				int m_switch2453_g3466 = _WindMode;
				float3 m_Off2453_g3466 = float3(0,0,0);
				int m_switch2439_g3466 = _WindType;
				float3 VERTEX_POSITION_MATRIX2352_g3466 = mul( GetObjectToWorldMatrix(), float4( inputMesh.positionOS , 0.0 ) ).xyz;
				float3 break2265_g3466 = VERTEX_POSITION_MATRIX2352_g3466;
				int WIND_MODE2462_g3466 = _WindMode;
				int m_switch2458_g3466 = WIND_MODE2462_g3466;
				float m_Off2458_g3466 = 1.0;
				float m_Global2458_g3466 = ( _GlobalWindInfluenceOther * _Global_Wind_Main_Intensity );
				float m_Local2458_g3466 = _LocalWindStrength;
				float localWind_Globalfloatswitch2458_g3466 = Wind_Globalfloatswitch( m_switch2458_g3466 , m_Off2458_g3466 , m_Global2458_g3466 , m_Local2458_g3466 );
				float _WIND_STRENGHT2400_g3466 = localWind_Globalfloatswitch2458_g3466;
				int m_switch2468_g3466 = WIND_MODE2462_g3466;
				float m_Off2468_g3466 = 1.0;
				float m_Global2468_g3466 = _Global_Wind_Main_RandomOffset;
				float m_Local2468_g3466 = _LocalRandomWindOffset;
				float localWind_Globalfloatswitch2468_g3466 = Wind_Globalfloatswitch( m_switch2468_g3466 , m_Off2468_g3466 , m_Global2468_g3466 , m_Local2468_g3466 );
				float4 transform3073_g3466 = mul(GetObjectToWorldMatrix(),float4( 0,0,0,1 ));
				transform3073_g3466.xyz = GetAbsolutePositionWS((transform3073_g3466).xyz);
				float2 appendResult2307_g3466 = (float2(transform3073_g3466.x , transform3073_g3466.z));
				float dotResult2341_g3466 = dot( appendResult2307_g3466 , float2( 12.9898,78.233 ) );
				float lerpResult2238_g3466 = lerp( 0.8 , ( ( localWind_Globalfloatswitch2468_g3466 / 2.0 ) + 0.9 ) , frac( ( sin( dotResult2341_g3466 ) * 43758.55 ) ));
				float _WIND_RANDOM_OFFSET2244_g3466 = ( ( _TimeParameters.x * 0.05 ) * lerpResult2238_g3466 );
				float _WIND_TUBULENCE_RANDOM2274_g3466 = ( sin( ( ( _WIND_RANDOM_OFFSET2244_g3466 * 40.0 ) - ( VERTEX_POSITION_MATRIX2352_g3466.z / 15.0 ) ) ) * 0.5 );
				int m_switch2312_g3466 = WIND_MODE2462_g3466;
				float m_Off2312_g3466 = 1.0;
				float m_Global2312_g3466 = _Global_Wind_Main_Pulse;
				float m_Local2312_g3466 = _LocalWindPulse;
				float localWind_Globalfloatswitch2312_g3466 = Wind_Globalfloatswitch( m_switch2312_g3466 , m_Off2312_g3466 , m_Global2312_g3466 , m_Local2312_g3466 );
				float _WIND_PULSE2421_g3466 = localWind_Globalfloatswitch2312_g3466;
				float FUNC_Angle2470_g3466 = ( _WIND_STRENGHT2400_g3466 * ( 1.0 + sin( ( ( ( ( _WIND_RANDOM_OFFSET2244_g3466 * 2.0 ) + _WIND_TUBULENCE_RANDOM2274_g3466 ) - ( VERTEX_POSITION_MATRIX2352_g3466.z / 50.0 ) ) - ( inputMesh.ase_color.r / 20.0 ) ) ) ) * sqrt( inputMesh.ase_color.r ) * _WIND_PULSE2421_g3466 );
				float FUNC_Angle_SinA2424_g3466 = sin( FUNC_Angle2470_g3466 );
				float FUNC_Angle_CosA2362_g3466 = cos( FUNC_Angle2470_g3466 );
				int m_switch2456_g3466 = WIND_MODE2462_g3466;
				float m_Off2456_g3466 = 1.0;
				float m_Global2456_g3466 = _Global_Wind_Main_Direction;
				float m_Local2456_g3466 = _LocalWindDirection;
				float localWind_Globalfloatswitch2456_g3466 = Wind_Globalfloatswitch( m_switch2456_g3466 , m_Off2456_g3466 , m_Global2456_g3466 , m_Local2456_g3466 );
				float _WindDirection2249_g3466 = localWind_Globalfloatswitch2456_g3466;
				float2 localDirectionalEquation2249_g3466 = DirectionalEquation( _WindDirection2249_g3466 );
				float2 break2469_g3466 = localDirectionalEquation2249_g3466;
				float _WIND_DIRECTION_X2418_g3466 = break2469_g3466.x;
				float lerpResult2258_g3466 = lerp( break2265_g3466.x , ( ( break2265_g3466.y * FUNC_Angle_SinA2424_g3466 ) + ( break2265_g3466.x * FUNC_Angle_CosA2362_g3466 ) ) , _WIND_DIRECTION_X2418_g3466);
				float3 break2340_g3466 = VERTEX_POSITION_MATRIX2352_g3466;
				float3 break2233_g3466 = VERTEX_POSITION_MATRIX2352_g3466;
				float _WIND_DIRECTION_Y2416_g3466 = break2469_g3466.y;
				float lerpResult2275_g3466 = lerp( break2233_g3466.z , ( ( break2233_g3466.y * FUNC_Angle_SinA2424_g3466 ) + ( break2233_g3466.z * FUNC_Angle_CosA2362_g3466 ) ) , _WIND_DIRECTION_Y2416_g3466);
				float3 appendResult2235_g3466 = (float3(lerpResult2258_g3466 , ( ( break2340_g3466.y * FUNC_Angle_CosA2362_g3466 ) - ( break2340_g3466.z * FUNC_Angle_SinA2424_g3466 ) ) , lerpResult2275_g3466));
				float3 VERTEX_POSITION2282_g3466 = ( mul( GetWorldToObjectMatrix(), float4( appendResult2235_g3466 , 0.0 ) ).xyz - inputMesh.positionOS );
				float3 break2518_g3466 = VERTEX_POSITION2282_g3466;
				half FUNC_SinFunction2336_g3466 = sin( ( ( _WIND_RANDOM_OFFSET2244_g3466 * 200.0 * ( 0.2 + inputMesh.ase_color.g ) ) + ( inputMesh.ase_color.g * 10.0 ) + _WIND_TUBULENCE_RANDOM2274_g3466 + ( VERTEX_POSITION_MATRIX2352_g3466.z / 2.0 ) ) );
				int m_switch2326_g3466 = WIND_MODE2462_g3466;
				float m_Off2326_g3466 = 1.0;
				float m_Global2326_g3466 = ( _GlobalTurbulenceInfluence * _Global_Wind_Main_Turbulence );
				float m_Local2326_g3466 = _LocalWindTurbulence;
				float localWind_Globalfloatswitch2326_g3466 = Wind_Globalfloatswitch( m_switch2326_g3466 , m_Off2326_g3466 , m_Global2326_g3466 , m_Local2326_g3466 );
				float _WIND_TUBULENCE2442_g3466 = localWind_Globalfloatswitch2326_g3466;
				float3 appendResult2480_g3466 = (float3(break2518_g3466.x , ( break2518_g3466.y + ( FUNC_SinFunction2336_g3466 * inputMesh.ase_color.b * ( FUNC_Angle2470_g3466 + ( _WIND_STRENGHT2400_g3466 / 200.0 ) ) * _WIND_TUBULENCE2442_g3466 ) ) , break2518_g3466.z));
				float3 VERTEX_LEAF2396_g3466 = appendResult2480_g3466;
				float3 m_Leaf2439_g3466 = VERTEX_LEAF2396_g3466;
				float3 VERTEX_PALM2310_g3466 = ( ( FUNC_SinFunction2336_g3466 * inputMesh.ase_color.b * ( FUNC_Angle2470_g3466 + ( _WIND_STRENGHT2400_g3466 / 200.0 ) ) * _WIND_TUBULENCE2442_g3466 ) + VERTEX_POSITION2282_g3466 );
				float3 m_Palm2439_g3466 = VERTEX_PALM2310_g3466;
				float3 break2486_g3466 = VERTEX_POSITION2282_g3466;
				float temp_output_2514_0_g3466 = ( FUNC_SinFunction2336_g3466 * inputMesh.ase_color.b * ( FUNC_Angle2470_g3466 + ( _WIND_STRENGHT2400_g3466 / 200.0 ) ) );
				float lerpResult2482_g3466 = lerp( 0.0 , temp_output_2514_0_g3466 , _WIND_DIRECTION_X2418_g3466);
				float lerpResult2484_g3466 = lerp( 0.0 , temp_output_2514_0_g3466 , _WIND_DIRECTION_Y2416_g3466);
				float3 appendResult2489_g3466 = (float3(( break2486_g3466.x + lerpResult2482_g3466 ) , break2486_g3466.y , ( break2486_g3466.z + lerpResult2484_g3466 )));
				float3 VERTEX_GRASS2242_g3466 = appendResult2489_g3466;
				float3 m_Grass2439_g3466 = VERTEX_GRASS2242_g3466;
				float3 m_Simple2439_g3466 = VERTEX_POSITION2282_g3466;
				float clampResult2884_g3466 = clamp( ( _WIND_STRENGHT2400_g3466 - 0.95 ) , 0.0 , 1.0 );
				float3 break2708_g3466 = VERTEX_POSITION2282_g3466;
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				float3 break2718_g3466 = ase_worldPos;
				float temp_output_2690_0_g3466 = ( _WIND_RANDOM_OFFSET2244_g3466 * 25.0 );
				float clampResult2691_g3466 = clamp( 25.0 , 0.2 , 0.25 );
				float2 appendResult2694_g3466 = (float2(temp_output_2690_0_g3466 , ( temp_output_2690_0_g3466 / clampResult2691_g3466 )));
				float3 appendResult2706_g3466 = (float3(break2708_g3466.x , ( break2708_g3466.y + cos( ( ( ( break2718_g3466.x + break2718_g3466.y + break2718_g3466.z ) * 2.0 ) + appendResult2694_g3466 + FUNC_Angle2470_g3466 + _WIND_TUBULENCE2442_g3466 ) ) ).x , break2708_g3466.z));
				float3 temp_output_2613_0_g3466 = ( clampResult2884_g3466 * appendResult2706_g3466 );
				float3 VERTEX_IVY997_g3466 = ( ( ( cos( temp_output_2613_0_g3466 ) + ( -0.3193 * PI ) ) * inputMesh.normalOS * 0.2 * ( FUNC_SinFunction2336_g3466 * inputMesh.ase_color.b ) ) + ( sin( temp_output_2613_0_g3466 ) * cross( inputMesh.normalOS , inputMesh.ase_tangent.xyz ) * 0.2 ) );
				float3 m_Ivy2439_g3466 = VERTEX_IVY997_g3466;
				float3 localWind_Typefloat3switch2439_g3466 = Wind_Typefloat3switch2439_g3466( m_switch2439_g3466 , m_Leaf2439_g3466 , m_Palm2439_g3466 , m_Grass2439_g3466 , m_Simple2439_g3466 , m_Ivy2439_g3466 );
				float3 m_Global2453_g3466 = localWind_Typefloat3switch2439_g3466;
				float3 m_Local2453_g3466 = localWind_Typefloat3switch2439_g3466;
				float3 localWind_Globalfloat3switch2453_g3466 = Wind_Globalfloat3switch( m_switch2453_g3466 , m_Off2453_g3466 , m_Global2453_g3466 , m_Local2453_g3466 );
				float3 m_Off3050_g3466 = localWind_Globalfloat3switch2453_g3466;
				float temp_output_3048_0_g3466 = saturate( pow( ( distance( _WorldSpaceCameraPos , ase_worldPos ) / _Global_Wind_Main_Fade_Bias ) , 5.0 ) );
				float3 m_ActiveFadeOut3050_g3466 = ( localWind_Globalfloat3switch2453_g3466 * ( 1.0 - temp_output_3048_0_g3466 ) );
				float3 m_ActiveFadeIn3050_g3466 = ( localWind_Globalfloat3switch2453_g3466 * temp_output_3048_0_g3466 );
				float3 localWind_Fadefloat3switch3050_g3466 = Wind_Fadefloat3switch3050_g3466( m_switch3050_g3466 , m_Off3050_g3466 , m_ActiveFadeOut3050_g3466 , m_ActiveFadeIn3050_g3466 );
				float3 temp_output_1234_0_g43431 = localWind_Fadefloat3switch3050_g3466;
				
				outputPackedVaryingsMeshToPS.ase_texcoord1.xy = inputMesh.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord1.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = temp_output_1234_0_g43431;

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
				float4 ase_tangent : TANGENT;
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
				o.ase_tangent = v.ase_tangent;
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
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
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
				float2 appendResult168_g43431 = (float2(_TilingX , _TilingY));
				float2 appendResult167_g43431 = (float2(_OffsetX , _OffsetY));
				float2 texCoord2_g43454 = packedInput.ase_texcoord1.xy * appendResult168_g43431 + appendResult167_g43431;
				float2 OUT_UV213_g43431 = texCoord2_g43454;
				float2 UV40_g43445 = OUT_UV213_g43431;
				float4 tex2DNode63_g43445 = SAMPLE_TEXTURE2D( _MainTex, sampler_trilinear_repeat, UV40_g43445 );
				float ALBEDO_A926_g43431 = tex2DNode63_g43445.a;
				float temp_output_1_0_g43439 = ALBEDO_A926_g43431;
				float temp_output_6_0_g43439 = ( step( _CustomCutoffAntialias , temp_output_1_0_g43439 ) - step( temp_output_1_0_g43439 , _CustomCutoffAntialias ) );
				float lerpResult10_g43439 = lerp( temp_output_1_0_g43439 , saturate( ( temp_output_6_0_g43439 / fwidth( temp_output_6_0_g43439 ) ) ) , _EnableCustomAntialias);
				float Albedo_Alpha52_g43443 = lerpResult10_g43439;
				float3 ase_worldPos = GetAbsolutePositionWS( positionRWS );
				float3 normalizeResult38_g43443 = normalize( cross( ddx( ase_worldPos ) , ddy( ase_worldPos ) ) );
				float dotResult35_g43443 = dot( normalizeResult38_g43443 , V );
				float temp_output_32_0_g43443 = ( 1.0 - abs( dotResult35_g43443 ) );
				float lerpResult67_g43443 = lerp( 1.0 , ( 1.0 - ( temp_output_32_0_g43443 * temp_output_32_0_g43443 ) ) , _GlancingClipMode);
				float OpacityMask42_g43443 = lerpResult67_g43443;
				
				surfaceDescription.Alpha = ( Albedo_Alpha52_g43443 * OpacityMask42_g43443 );

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = _Cutoff;
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
			#define _MATERIAL_FEATURE_TRANSMISSION 1
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
			float4 _ColorShift_MaskMap_ST;
			float4 _Smoothness;
			float4 _Color;
			float _DoubleSidedGIMode;
			float _ColorShift_ShiftSaturation;
			float _ColorShift_MaskFuzziness;
			float _ColorShift_ShiftInfluence;
			half _NormalStrength;
			int _NormalMapSpace;
			half _NormalStrengthBent;
			int _SmoothnessSource;
			float _OcclusionStrengthAO;
			float _OcclusionSource;
			float _CustomCutoffAntialias;
			float _EnableCustomAntialias;
			float _GlancingClipMode;
			float _Cutoff;
			float _AlphaCutoffShadow;
			float _SpecularAAScreenSpaceVariance;
			float _EnableGeometricSpecularAA;
			float _SpecularAAThreshold;
			float _SubsurfaceDistortionHDRP;
			float _SubsurfacePower;
			float _SubsurfaceIntensityHDRP;
			int _TranslucencySourceHDRP;
			float _TranslucencyThicknessFeather;
			float _TranslucencyThickness;
			float _TranslucentScatteringHDRP;
			float _ColorShift_ShiftVariationRGB;
			float _ColorShift_ShiftVariation;
			float _ColorShift_WorldSpaceDistance;
			float _ColorShift_WorldSpaceOffset;
			half _EmissionFlags;
			float _TransparentWritingMotionVec;
			float _EnableBlendModePreserveSpecularLighting;
			float _AlphaToMaskInspectorValue;
			int _OpaqueCullMode;
			float _SmoothnessMax;
			float _SmoothnessMin;
			int _WindMode;
			int _WindType;
			float _GlobalWindInfluenceOther;
			float _LocalWindStrength;
			float _LocalRandomWindOffset;
			float _LocalWindPulse;
			float _LocalWindDirection;
			float _GlobalTurbulenceInfluence;
			float _LocalWindTurbulence;
			int _ColorShift_Mode;
			float _TilingX;
			float _TilingY;
			float _OffsetX;
			float _OffsetY;
			half _Brightness;
			int _ColorShift_MaskMode;
			float _ColorShift_NoiseScale;
			float _ColorShift_WorldSpaceNoiseShift;
			float _EnableTranslucency;
			float _DiffusionProfileHash;
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
			float _Global_Wind_Main_Turbulence;
			float _Global_Wind_Main_Fade_Bias;
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_trilinear_repeat);
			TEXTURE2D(_SmoothnessMap);
			TEXTURE2D(_MainTex);
			TEXTURE2D(_OcclusionMap);


			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_RELATIVE_WORLD_POS
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
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
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};

			float4 mod289( float4 x )
			{
				return x - floor(x * (1.0 / 289.0)) * 289.0;
			}
			
			float4 perm( float4 x )
			{
				return mod289(((x * 34.0) + 1.0) * x);
			}
			
			float SimpleNoise3D( float3 p )
			{
				 float3 a = floor(p);
				    float3 d = p - a;
				    d = d * d * (3.0 - 2.0 * d);
				 float4 b = a.xxyy + float4(0.0, 1.0, 0.0, 1.0);
				    float4 k1 = perm(b.xyxy);
				 float4 k2 = perm(k1.xyxy + b.zzww);
				    float4 c = k2 + a.zzzz;
				    float4 k3 = perm(c);
				    float4 k4 = perm(c + 1.0);
				    float4 o1 = frac(k3 * (1.0 / 41.0));
				 float4 o2 = frac(k4 * (1.0 / 41.0));
				    float4 o3 = o2 * d.z + o1 * (1.0 - d.z);
				    float2 o4 = o3.yw * d.x + o3.xz * (1.0 - d.x);
				    return o4.y * d.y + o4.x * (1.0 - d.y);
			}
			
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
			
			float3 Wind_Typefloat3switch2439_g3466( int m_switch, float3 m_Leaf, float3 m_Palm, float3 m_Grass, float3 m_Simple, float3 m_Ivy )
			{
				if(m_switch ==0)
					return m_Leaf;
				else if(m_switch ==1)
					return m_Palm;
				else if(m_switch ==2)
					return m_Grass;
				else if(m_switch ==3)
					return m_Simple;
				else if(m_switch ==4)
					return m_Ivy;
				else
				return float3(0,0,0);
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
			
			float3 Wind_Fadefloat3switch3050_g3466( int m_switch, float3 m_Off, float3 m_ActiveFadeOut, float3 m_ActiveFadeIn )
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
			
			float4 SmoothnessTypefloat4switch215_g43455( int m_switch, float4 m_Smoothness, float4 m_Roughness, float4 m_Geometric )
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

				int m_switch3050_g3466 = _Global_Wind_Main_Fade_Enabled;
				int m_switch2453_g3466 = _WindMode;
				float3 m_Off2453_g3466 = float3(0,0,0);
				int m_switch2439_g3466 = _WindType;
				float3 VERTEX_POSITION_MATRIX2352_g3466 = mul( GetObjectToWorldMatrix(), float4( inputMesh.positionOS , 0.0 ) ).xyz;
				float3 break2265_g3466 = VERTEX_POSITION_MATRIX2352_g3466;
				int WIND_MODE2462_g3466 = _WindMode;
				int m_switch2458_g3466 = WIND_MODE2462_g3466;
				float m_Off2458_g3466 = 1.0;
				float m_Global2458_g3466 = ( _GlobalWindInfluenceOther * _Global_Wind_Main_Intensity );
				float m_Local2458_g3466 = _LocalWindStrength;
				float localWind_Globalfloatswitch2458_g3466 = Wind_Globalfloatswitch( m_switch2458_g3466 , m_Off2458_g3466 , m_Global2458_g3466 , m_Local2458_g3466 );
				float _WIND_STRENGHT2400_g3466 = localWind_Globalfloatswitch2458_g3466;
				int m_switch2468_g3466 = WIND_MODE2462_g3466;
				float m_Off2468_g3466 = 1.0;
				float m_Global2468_g3466 = _Global_Wind_Main_RandomOffset;
				float m_Local2468_g3466 = _LocalRandomWindOffset;
				float localWind_Globalfloatswitch2468_g3466 = Wind_Globalfloatswitch( m_switch2468_g3466 , m_Off2468_g3466 , m_Global2468_g3466 , m_Local2468_g3466 );
				float4 transform3073_g3466 = mul(GetObjectToWorldMatrix(),float4( 0,0,0,1 ));
				transform3073_g3466.xyz = GetAbsolutePositionWS((transform3073_g3466).xyz);
				float2 appendResult2307_g3466 = (float2(transform3073_g3466.x , transform3073_g3466.z));
				float dotResult2341_g3466 = dot( appendResult2307_g3466 , float2( 12.9898,78.233 ) );
				float lerpResult2238_g3466 = lerp( 0.8 , ( ( localWind_Globalfloatswitch2468_g3466 / 2.0 ) + 0.9 ) , frac( ( sin( dotResult2341_g3466 ) * 43758.55 ) ));
				float _WIND_RANDOM_OFFSET2244_g3466 = ( ( _TimeParameters.x * 0.05 ) * lerpResult2238_g3466 );
				float _WIND_TUBULENCE_RANDOM2274_g3466 = ( sin( ( ( _WIND_RANDOM_OFFSET2244_g3466 * 40.0 ) - ( VERTEX_POSITION_MATRIX2352_g3466.z / 15.0 ) ) ) * 0.5 );
				int m_switch2312_g3466 = WIND_MODE2462_g3466;
				float m_Off2312_g3466 = 1.0;
				float m_Global2312_g3466 = _Global_Wind_Main_Pulse;
				float m_Local2312_g3466 = _LocalWindPulse;
				float localWind_Globalfloatswitch2312_g3466 = Wind_Globalfloatswitch( m_switch2312_g3466 , m_Off2312_g3466 , m_Global2312_g3466 , m_Local2312_g3466 );
				float _WIND_PULSE2421_g3466 = localWind_Globalfloatswitch2312_g3466;
				float FUNC_Angle2470_g3466 = ( _WIND_STRENGHT2400_g3466 * ( 1.0 + sin( ( ( ( ( _WIND_RANDOM_OFFSET2244_g3466 * 2.0 ) + _WIND_TUBULENCE_RANDOM2274_g3466 ) - ( VERTEX_POSITION_MATRIX2352_g3466.z / 50.0 ) ) - ( inputMesh.ase_color.r / 20.0 ) ) ) ) * sqrt( inputMesh.ase_color.r ) * _WIND_PULSE2421_g3466 );
				float FUNC_Angle_SinA2424_g3466 = sin( FUNC_Angle2470_g3466 );
				float FUNC_Angle_CosA2362_g3466 = cos( FUNC_Angle2470_g3466 );
				int m_switch2456_g3466 = WIND_MODE2462_g3466;
				float m_Off2456_g3466 = 1.0;
				float m_Global2456_g3466 = _Global_Wind_Main_Direction;
				float m_Local2456_g3466 = _LocalWindDirection;
				float localWind_Globalfloatswitch2456_g3466 = Wind_Globalfloatswitch( m_switch2456_g3466 , m_Off2456_g3466 , m_Global2456_g3466 , m_Local2456_g3466 );
				float _WindDirection2249_g3466 = localWind_Globalfloatswitch2456_g3466;
				float2 localDirectionalEquation2249_g3466 = DirectionalEquation( _WindDirection2249_g3466 );
				float2 break2469_g3466 = localDirectionalEquation2249_g3466;
				float _WIND_DIRECTION_X2418_g3466 = break2469_g3466.x;
				float lerpResult2258_g3466 = lerp( break2265_g3466.x , ( ( break2265_g3466.y * FUNC_Angle_SinA2424_g3466 ) + ( break2265_g3466.x * FUNC_Angle_CosA2362_g3466 ) ) , _WIND_DIRECTION_X2418_g3466);
				float3 break2340_g3466 = VERTEX_POSITION_MATRIX2352_g3466;
				float3 break2233_g3466 = VERTEX_POSITION_MATRIX2352_g3466;
				float _WIND_DIRECTION_Y2416_g3466 = break2469_g3466.y;
				float lerpResult2275_g3466 = lerp( break2233_g3466.z , ( ( break2233_g3466.y * FUNC_Angle_SinA2424_g3466 ) + ( break2233_g3466.z * FUNC_Angle_CosA2362_g3466 ) ) , _WIND_DIRECTION_Y2416_g3466);
				float3 appendResult2235_g3466 = (float3(lerpResult2258_g3466 , ( ( break2340_g3466.y * FUNC_Angle_CosA2362_g3466 ) - ( break2340_g3466.z * FUNC_Angle_SinA2424_g3466 ) ) , lerpResult2275_g3466));
				float3 VERTEX_POSITION2282_g3466 = ( mul( GetWorldToObjectMatrix(), float4( appendResult2235_g3466 , 0.0 ) ).xyz - inputMesh.positionOS );
				float3 break2518_g3466 = VERTEX_POSITION2282_g3466;
				half FUNC_SinFunction2336_g3466 = sin( ( ( _WIND_RANDOM_OFFSET2244_g3466 * 200.0 * ( 0.2 + inputMesh.ase_color.g ) ) + ( inputMesh.ase_color.g * 10.0 ) + _WIND_TUBULENCE_RANDOM2274_g3466 + ( VERTEX_POSITION_MATRIX2352_g3466.z / 2.0 ) ) );
				int m_switch2326_g3466 = WIND_MODE2462_g3466;
				float m_Off2326_g3466 = 1.0;
				float m_Global2326_g3466 = ( _GlobalTurbulenceInfluence * _Global_Wind_Main_Turbulence );
				float m_Local2326_g3466 = _LocalWindTurbulence;
				float localWind_Globalfloatswitch2326_g3466 = Wind_Globalfloatswitch( m_switch2326_g3466 , m_Off2326_g3466 , m_Global2326_g3466 , m_Local2326_g3466 );
				float _WIND_TUBULENCE2442_g3466 = localWind_Globalfloatswitch2326_g3466;
				float3 appendResult2480_g3466 = (float3(break2518_g3466.x , ( break2518_g3466.y + ( FUNC_SinFunction2336_g3466 * inputMesh.ase_color.b * ( FUNC_Angle2470_g3466 + ( _WIND_STRENGHT2400_g3466 / 200.0 ) ) * _WIND_TUBULENCE2442_g3466 ) ) , break2518_g3466.z));
				float3 VERTEX_LEAF2396_g3466 = appendResult2480_g3466;
				float3 m_Leaf2439_g3466 = VERTEX_LEAF2396_g3466;
				float3 VERTEX_PALM2310_g3466 = ( ( FUNC_SinFunction2336_g3466 * inputMesh.ase_color.b * ( FUNC_Angle2470_g3466 + ( _WIND_STRENGHT2400_g3466 / 200.0 ) ) * _WIND_TUBULENCE2442_g3466 ) + VERTEX_POSITION2282_g3466 );
				float3 m_Palm2439_g3466 = VERTEX_PALM2310_g3466;
				float3 break2486_g3466 = VERTEX_POSITION2282_g3466;
				float temp_output_2514_0_g3466 = ( FUNC_SinFunction2336_g3466 * inputMesh.ase_color.b * ( FUNC_Angle2470_g3466 + ( _WIND_STRENGHT2400_g3466 / 200.0 ) ) );
				float lerpResult2482_g3466 = lerp( 0.0 , temp_output_2514_0_g3466 , _WIND_DIRECTION_X2418_g3466);
				float lerpResult2484_g3466 = lerp( 0.0 , temp_output_2514_0_g3466 , _WIND_DIRECTION_Y2416_g3466);
				float3 appendResult2489_g3466 = (float3(( break2486_g3466.x + lerpResult2482_g3466 ) , break2486_g3466.y , ( break2486_g3466.z + lerpResult2484_g3466 )));
				float3 VERTEX_GRASS2242_g3466 = appendResult2489_g3466;
				float3 m_Grass2439_g3466 = VERTEX_GRASS2242_g3466;
				float3 m_Simple2439_g3466 = VERTEX_POSITION2282_g3466;
				float clampResult2884_g3466 = clamp( ( _WIND_STRENGHT2400_g3466 - 0.95 ) , 0.0 , 1.0 );
				float3 break2708_g3466 = VERTEX_POSITION2282_g3466;
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				float3 break2718_g3466 = ase_worldPos;
				float temp_output_2690_0_g3466 = ( _WIND_RANDOM_OFFSET2244_g3466 * 25.0 );
				float clampResult2691_g3466 = clamp( 25.0 , 0.2 , 0.25 );
				float2 appendResult2694_g3466 = (float2(temp_output_2690_0_g3466 , ( temp_output_2690_0_g3466 / clampResult2691_g3466 )));
				float3 appendResult2706_g3466 = (float3(break2708_g3466.x , ( break2708_g3466.y + cos( ( ( ( break2718_g3466.x + break2718_g3466.y + break2718_g3466.z ) * 2.0 ) + appendResult2694_g3466 + FUNC_Angle2470_g3466 + _WIND_TUBULENCE2442_g3466 ) ) ).x , break2708_g3466.z));
				float3 temp_output_2613_0_g3466 = ( clampResult2884_g3466 * appendResult2706_g3466 );
				float3 VERTEX_IVY997_g3466 = ( ( ( cos( temp_output_2613_0_g3466 ) + ( -0.3193 * PI ) ) * inputMesh.normalOS * 0.2 * ( FUNC_SinFunction2336_g3466 * inputMesh.ase_color.b ) ) + ( sin( temp_output_2613_0_g3466 ) * cross( inputMesh.normalOS , inputMesh.tangentOS.xyz ) * 0.2 ) );
				float3 m_Ivy2439_g3466 = VERTEX_IVY997_g3466;
				float3 localWind_Typefloat3switch2439_g3466 = Wind_Typefloat3switch2439_g3466( m_switch2439_g3466 , m_Leaf2439_g3466 , m_Palm2439_g3466 , m_Grass2439_g3466 , m_Simple2439_g3466 , m_Ivy2439_g3466 );
				float3 m_Global2453_g3466 = localWind_Typefloat3switch2439_g3466;
				float3 m_Local2453_g3466 = localWind_Typefloat3switch2439_g3466;
				float3 localWind_Globalfloat3switch2453_g3466 = Wind_Globalfloat3switch( m_switch2453_g3466 , m_Off2453_g3466 , m_Global2453_g3466 , m_Local2453_g3466 );
				float3 m_Off3050_g3466 = localWind_Globalfloat3switch2453_g3466;
				float temp_output_3048_0_g3466 = saturate( pow( ( distance( _WorldSpaceCameraPos , ase_worldPos ) / _Global_Wind_Main_Fade_Bias ) , 5.0 ) );
				float3 m_ActiveFadeOut3050_g3466 = ( localWind_Globalfloat3switch2453_g3466 * ( 1.0 - temp_output_3048_0_g3466 ) );
				float3 m_ActiveFadeIn3050_g3466 = ( localWind_Globalfloat3switch2453_g3466 * temp_output_3048_0_g3466 );
				float3 localWind_Fadefloat3switch3050_g3466 = Wind_Fadefloat3switch3050_g3466( m_switch3050_g3466 , m_Off3050_g3466 , m_ActiveFadeOut3050_g3466 , m_ActiveFadeIn3050_g3466 );
				float3 temp_output_1234_0_g43431 = localWind_Fadefloat3switch3050_g3466;
				
				float3 ase_worldNormal = TransformObjectToWorldNormal(inputMesh.normalOS);
				float3 ase_worldTangent = TransformObjectToWorldDir(inputMesh.tangentOS.xyz);
				float ase_vertexTangentSign = inputMesh.tangentOS.w * unity_WorldTransformParams.w;
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				outputPackedVaryingsMeshToPS.ase_texcoord4.xyz = ase_worldBitangent;
				
				outputPackedVaryingsMeshToPS.ase_texcoord3.xy = inputMesh.ase_texcoord.xy;
				outputPackedVaryingsMeshToPS.ase_color = inputMesh.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord3.zw = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord4.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = temp_output_1234_0_g43431;

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
				float2 appendResult168_g43431 = (float2(_TilingX , _TilingY));
				float2 appendResult167_g43431 = (float2(_OffsetX , _OffsetY));
				float2 texCoord2_g43454 = packedInput.ase_texcoord3.xy * appendResult168_g43431 + appendResult167_g43431;
				float2 OUT_UV213_g43431 = texCoord2_g43454;
				float2 UV40_g43445 = OUT_UV213_g43431;
				float4 NORMAL_RGB1382_g43431 = SAMPLE_TEXTURE2D( _BumpMap, sampler_trilinear_repeat, UV40_g43445 );
				float4 temp_output_1_0_g43450 = NORMAL_RGB1382_g43431;
				float temp_output_8_0_g43450 = _NormalStrength;
				float3 unpack52_g43450 = UnpackNormalScale( temp_output_1_0_g43450, temp_output_8_0_g43450 );
				unpack52_g43450.z = lerp( 1, unpack52_g43450.z, saturate(temp_output_8_0_g43450) );
				float3 temp_output_1519_59_g43431 = unpack52_g43450;
				float3 NORMAL_IN42_g43456 = temp_output_1519_59_g43431;
				float3 temp_output_1610_30_g43431 = NORMAL_IN42_g43456;
				
				int temp_output_223_0_g43455 = _SmoothnessSource;
				int m_switch215_g43455 = temp_output_223_0_g43455;
				float4 MASK_G158_g43431 = SAMPLE_TEXTURE2D( _SmoothnessMap, sampler_trilinear_repeat, UV40_g43445 );
				float4 temp_cast_2 = (_SmoothnessMin).xxxx;
				float4 temp_cast_3 = (_SmoothnessMax).xxxx;
				float4 temp_output_216_0_g43455 = (temp_cast_2 + (MASK_G158_g43431 - float4( 0,0,0,0 )) * (temp_cast_3 - temp_cast_2) / (float4( 1,1,1,1 ) - float4( 0,0,0,0 )));
				float4 m_Smoothness215_g43455 = temp_output_216_0_g43455;
				float4 temp_cast_4 = (_SmoothnessMin).xxxx;
				float4 temp_cast_5 = (_SmoothnessMax).xxxx;
				float4 temp_output_214_0_g43455 = ( 1.0 - temp_output_216_0_g43455 );
				float4 m_Roughness215_g43455 = temp_output_214_0_g43455;
				float4 temp_cast_6 = (_SmoothnessMin).xxxx;
				float4 temp_cast_7 = (_SmoothnessMax).xxxx;
				float3 NORMAL_OUT1491_g43431 = temp_output_1610_30_g43431;
				float3 ase_worldBitangent = packedInput.ase_texcoord4.xyz;
				float3 tanToWorld0 = float3( tangentWS.xyz.x, ase_worldBitangent.x, normalWS.x );
				float3 tanToWorld1 = float3( tangentWS.xyz.y, ase_worldBitangent.y, normalWS.y );
				float3 tanToWorld2 = float3( tangentWS.xyz.z, ase_worldBitangent.z, normalWS.z );
				float3 tanNormal1608_g43431 = NORMAL_OUT1491_g43431;
				float3 worldNormal1608_g43431 = normalize( float3(dot(tanToWorld0,tanNormal1608_g43431), dot(tanToWorld1,tanNormal1608_g43431), dot(tanToWorld2,tanNormal1608_g43431)) );
				float3 temp_output_4_0_g43455 = worldNormal1608_g43431;
				float3 temp_output_178_0_g43455 = ddx( temp_output_4_0_g43455 );
				float dotResult195_g43455 = dot( temp_output_178_0_g43455 , temp_output_178_0_g43455 );
				float3 temp_output_175_0_g43455 = ddy( temp_output_4_0_g43455 );
				float dotResult201_g43455 = dot( temp_output_175_0_g43455 , temp_output_175_0_g43455 );
				float4 tex2DNode63_g43445 = SAMPLE_TEXTURE2D( _MainTex, sampler_trilinear_repeat, UV40_g43445 );
				float ALBEDO_R172_g43431 = tex2DNode63_g43445.r;
				float4 temp_cast_8 = (ALBEDO_R172_g43431).xxxx;
				float4 m_Geometric215_g43455 = ( sqrt( saturate( ( temp_output_216_0_g43455 + ( ( dotResult195_g43455 + dotResult201_g43455 ) * 2.0 ) ) ) ) * ( 1.0 - temp_cast_8 ) );
				float4 localSmoothnessTypefloat4switch215_g43455 = SmoothnessTypefloat4switch215_g43455( m_switch215_g43455 , m_Smoothness215_g43455 , m_Roughness215_g43455 , m_Geometric215_g43455 );
				float4 temp_output_1635_33_g43431 = localSmoothnessTypefloat4switch215_g43455;
				float4 PBR_Occlusion1712_g43431 = SAMPLE_TEXTURE2D( _OcclusionMap, sampler_trilinear_repeat, UV40_g43445 );
				float temp_output_16_0_g43444 = _OcclusionStrengthAO;
				float temp_output_65_0_g43444 = ( 1.0 - temp_output_16_0_g43444 );
				float3 appendResult69_g43444 = (float3(temp_output_65_0_g43444 , temp_output_65_0_g43444 , temp_output_65_0_g43444));
				float4 color77_g43444 = IsGammaSpace() ? float4(1,1,1,1) : float4(1,1,1,1);
				float4 temp_cast_11 = (packedInput.ase_color.a).xxxx;
				float4 lerpResult75_g43444 = lerp( color77_g43444 , temp_cast_11 , temp_output_16_0_g43444);
				float4 lerpResult83_g43444 = lerp( float4( ( ( ( (PBR_Occlusion1712_g43431).xyz - float3( 0.5,0.5,0.5 ) ) * temp_output_16_0_g43444 ) + appendResult69_g43444 ) , 0.0 ) , lerpResult75_g43444 , _OcclusionSource);
				float4 Occlusion1628_g43431 = saturate( lerpResult83_g43444 );
				
				float ALBEDO_A926_g43431 = tex2DNode63_g43445.a;
				float temp_output_1_0_g43439 = ALBEDO_A926_g43431;
				float temp_output_6_0_g43439 = ( step( _CustomCutoffAntialias , temp_output_1_0_g43439 ) - step( temp_output_1_0_g43439 , _CustomCutoffAntialias ) );
				float lerpResult10_g43439 = lerp( temp_output_1_0_g43439 , saturate( ( temp_output_6_0_g43439 / fwidth( temp_output_6_0_g43439 ) ) ) , _EnableCustomAntialias);
				float Albedo_Alpha52_g43443 = lerpResult10_g43439;
				float3 ase_worldPos = GetAbsolutePositionWS( positionRWS );
				float3 normalizeResult38_g43443 = normalize( cross( ddx( ase_worldPos ) , ddy( ase_worldPos ) ) );
				float dotResult35_g43443 = dot( normalizeResult38_g43443 , V );
				float temp_output_32_0_g43443 = ( 1.0 - abs( dotResult35_g43443 ) );
				float lerpResult67_g43443 = lerp( 1.0 , ( 1.0 - ( temp_output_32_0_g43443 * temp_output_32_0_g43443 ) ) , _GlancingClipMode);
				float OpacityMask42_g43443 = lerpResult67_g43443;
				
				surfaceDescription.Normal = temp_output_1610_30_g43431;
				surfaceDescription.Smoothness = ( temp_output_1635_33_g43431 * Occlusion1628_g43431 ).x;
				surfaceDescription.Alpha = ( Albedo_Alpha52_g43443 * OpacityMask42_g43443 );

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = _Cutoff;
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
			#define _MATERIAL_FEATURE_TRANSMISSION 1
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
			float4 _ColorShift_MaskMap_ST;
			float4 _Smoothness;
			float4 _Color;
			float _DoubleSidedGIMode;
			float _ColorShift_ShiftSaturation;
			float _ColorShift_MaskFuzziness;
			float _ColorShift_ShiftInfluence;
			half _NormalStrength;
			int _NormalMapSpace;
			half _NormalStrengthBent;
			int _SmoothnessSource;
			float _OcclusionStrengthAO;
			float _OcclusionSource;
			float _CustomCutoffAntialias;
			float _EnableCustomAntialias;
			float _GlancingClipMode;
			float _Cutoff;
			float _AlphaCutoffShadow;
			float _SpecularAAScreenSpaceVariance;
			float _EnableGeometricSpecularAA;
			float _SpecularAAThreshold;
			float _SubsurfaceDistortionHDRP;
			float _SubsurfacePower;
			float _SubsurfaceIntensityHDRP;
			int _TranslucencySourceHDRP;
			float _TranslucencyThicknessFeather;
			float _TranslucencyThickness;
			float _TranslucentScatteringHDRP;
			float _ColorShift_ShiftVariationRGB;
			float _ColorShift_ShiftVariation;
			float _ColorShift_WorldSpaceDistance;
			float _ColorShift_WorldSpaceOffset;
			half _EmissionFlags;
			float _TransparentWritingMotionVec;
			float _EnableBlendModePreserveSpecularLighting;
			float _AlphaToMaskInspectorValue;
			int _OpaqueCullMode;
			float _SmoothnessMax;
			float _SmoothnessMin;
			int _WindMode;
			int _WindType;
			float _GlobalWindInfluenceOther;
			float _LocalWindStrength;
			float _LocalRandomWindOffset;
			float _LocalWindPulse;
			float _LocalWindDirection;
			float _GlobalTurbulenceInfluence;
			float _LocalWindTurbulence;
			int _ColorShift_Mode;
			float _TilingX;
			float _TilingY;
			float _OffsetX;
			float _OffsetY;
			half _Brightness;
			int _ColorShift_MaskMode;
			float _ColorShift_NoiseScale;
			float _ColorShift_WorldSpaceNoiseShift;
			float _EnableTranslucency;
			float _DiffusionProfileHash;
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
			float _Global_Wind_Main_Turbulence;
			float _Global_Wind_Main_Fade_Bias;
			TEXTURE2D(_BumpMap);
			SAMPLER(sampler_trilinear_repeat);
			TEXTURE2D(_SmoothnessMap);
			TEXTURE2D(_MainTex);
			TEXTURE2D(_OcclusionMap);


			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
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
				float4 ase_tangent : TANGENT;
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
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_color : COLOR;
				float4 ase_texcoord7 : TEXCOORD7;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};


			float4 mod289( float4 x )
			{
				return x - floor(x * (1.0 / 289.0)) * 289.0;
			}
			
			float4 perm( float4 x )
			{
				return mod289(((x * 34.0) + 1.0) * x);
			}
			
			float SimpleNoise3D( float3 p )
			{
				 float3 a = floor(p);
				    float3 d = p - a;
				    d = d * d * (3.0 - 2.0 * d);
				 float4 b = a.xxyy + float4(0.0, 1.0, 0.0, 1.0);
				    float4 k1 = perm(b.xyxy);
				 float4 k2 = perm(k1.xyxy + b.zzww);
				    float4 c = k2 + a.zzzz;
				    float4 k3 = perm(c);
				    float4 k4 = perm(c + 1.0);
				    float4 o1 = frac(k3 * (1.0 / 41.0));
				 float4 o2 = frac(k4 * (1.0 / 41.0));
				    float4 o3 = o2 * d.z + o1 * (1.0 - d.z);
				    float2 o4 = o3.yw * d.x + o3.xz * (1.0 - d.x);
				    return o4.y * d.y + o4.x * (1.0 - d.y);
			}
			
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
			
			float3 Wind_Typefloat3switch2439_g3466( int m_switch, float3 m_Leaf, float3 m_Palm, float3 m_Grass, float3 m_Simple, float3 m_Ivy )
			{
				if(m_switch ==0)
					return m_Leaf;
				else if(m_switch ==1)
					return m_Palm;
				else if(m_switch ==2)
					return m_Grass;
				else if(m_switch ==3)
					return m_Simple;
				else if(m_switch ==4)
					return m_Ivy;
				else
				return float3(0,0,0);
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
			
			float3 Wind_Fadefloat3switch3050_g3466( int m_switch, float3 m_Off, float3 m_ActiveFadeOut, float3 m_ActiveFadeIn )
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
			
			float4 SmoothnessTypefloat4switch215_g43455( int m_switch, float4 m_Smoothness, float4 m_Roughness, float4 m_Geometric )
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
				int m_switch3050_g3466 = _Global_Wind_Main_Fade_Enabled;
				int m_switch2453_g3466 = _WindMode;
				float3 m_Off2453_g3466 = float3(0,0,0);
				int m_switch2439_g3466 = _WindType;
				float3 VERTEX_POSITION_MATRIX2352_g3466 = mul( GetObjectToWorldMatrix(), float4( inputMesh.positionOS , 0.0 ) ).xyz;
				float3 break2265_g3466 = VERTEX_POSITION_MATRIX2352_g3466;
				int WIND_MODE2462_g3466 = _WindMode;
				int m_switch2458_g3466 = WIND_MODE2462_g3466;
				float m_Off2458_g3466 = 1.0;
				float m_Global2458_g3466 = ( _GlobalWindInfluenceOther * _Global_Wind_Main_Intensity );
				float m_Local2458_g3466 = _LocalWindStrength;
				float localWind_Globalfloatswitch2458_g3466 = Wind_Globalfloatswitch( m_switch2458_g3466 , m_Off2458_g3466 , m_Global2458_g3466 , m_Local2458_g3466 );
				float _WIND_STRENGHT2400_g3466 = localWind_Globalfloatswitch2458_g3466;
				int m_switch2468_g3466 = WIND_MODE2462_g3466;
				float m_Off2468_g3466 = 1.0;
				float m_Global2468_g3466 = _Global_Wind_Main_RandomOffset;
				float m_Local2468_g3466 = _LocalRandomWindOffset;
				float localWind_Globalfloatswitch2468_g3466 = Wind_Globalfloatswitch( m_switch2468_g3466 , m_Off2468_g3466 , m_Global2468_g3466 , m_Local2468_g3466 );
				float4 transform3073_g3466 = mul(GetObjectToWorldMatrix(),float4( 0,0,0,1 ));
				transform3073_g3466.xyz = GetAbsolutePositionWS((transform3073_g3466).xyz);
				float2 appendResult2307_g3466 = (float2(transform3073_g3466.x , transform3073_g3466.z));
				float dotResult2341_g3466 = dot( appendResult2307_g3466 , float2( 12.9898,78.233 ) );
				float lerpResult2238_g3466 = lerp( 0.8 , ( ( localWind_Globalfloatswitch2468_g3466 / 2.0 ) + 0.9 ) , frac( ( sin( dotResult2341_g3466 ) * 43758.55 ) ));
				float _WIND_RANDOM_OFFSET2244_g3466 = ( ( _TimeParameters.x * 0.05 ) * lerpResult2238_g3466 );
				float _WIND_TUBULENCE_RANDOM2274_g3466 = ( sin( ( ( _WIND_RANDOM_OFFSET2244_g3466 * 40.0 ) - ( VERTEX_POSITION_MATRIX2352_g3466.z / 15.0 ) ) ) * 0.5 );
				int m_switch2312_g3466 = WIND_MODE2462_g3466;
				float m_Off2312_g3466 = 1.0;
				float m_Global2312_g3466 = _Global_Wind_Main_Pulse;
				float m_Local2312_g3466 = _LocalWindPulse;
				float localWind_Globalfloatswitch2312_g3466 = Wind_Globalfloatswitch( m_switch2312_g3466 , m_Off2312_g3466 , m_Global2312_g3466 , m_Local2312_g3466 );
				float _WIND_PULSE2421_g3466 = localWind_Globalfloatswitch2312_g3466;
				float FUNC_Angle2470_g3466 = ( _WIND_STRENGHT2400_g3466 * ( 1.0 + sin( ( ( ( ( _WIND_RANDOM_OFFSET2244_g3466 * 2.0 ) + _WIND_TUBULENCE_RANDOM2274_g3466 ) - ( VERTEX_POSITION_MATRIX2352_g3466.z / 50.0 ) ) - ( inputMesh.ase_color.r / 20.0 ) ) ) ) * sqrt( inputMesh.ase_color.r ) * _WIND_PULSE2421_g3466 );
				float FUNC_Angle_SinA2424_g3466 = sin( FUNC_Angle2470_g3466 );
				float FUNC_Angle_CosA2362_g3466 = cos( FUNC_Angle2470_g3466 );
				int m_switch2456_g3466 = WIND_MODE2462_g3466;
				float m_Off2456_g3466 = 1.0;
				float m_Global2456_g3466 = _Global_Wind_Main_Direction;
				float m_Local2456_g3466 = _LocalWindDirection;
				float localWind_Globalfloatswitch2456_g3466 = Wind_Globalfloatswitch( m_switch2456_g3466 , m_Off2456_g3466 , m_Global2456_g3466 , m_Local2456_g3466 );
				float _WindDirection2249_g3466 = localWind_Globalfloatswitch2456_g3466;
				float2 localDirectionalEquation2249_g3466 = DirectionalEquation( _WindDirection2249_g3466 );
				float2 break2469_g3466 = localDirectionalEquation2249_g3466;
				float _WIND_DIRECTION_X2418_g3466 = break2469_g3466.x;
				float lerpResult2258_g3466 = lerp( break2265_g3466.x , ( ( break2265_g3466.y * FUNC_Angle_SinA2424_g3466 ) + ( break2265_g3466.x * FUNC_Angle_CosA2362_g3466 ) ) , _WIND_DIRECTION_X2418_g3466);
				float3 break2340_g3466 = VERTEX_POSITION_MATRIX2352_g3466;
				float3 break2233_g3466 = VERTEX_POSITION_MATRIX2352_g3466;
				float _WIND_DIRECTION_Y2416_g3466 = break2469_g3466.y;
				float lerpResult2275_g3466 = lerp( break2233_g3466.z , ( ( break2233_g3466.y * FUNC_Angle_SinA2424_g3466 ) + ( break2233_g3466.z * FUNC_Angle_CosA2362_g3466 ) ) , _WIND_DIRECTION_Y2416_g3466);
				float3 appendResult2235_g3466 = (float3(lerpResult2258_g3466 , ( ( break2340_g3466.y * FUNC_Angle_CosA2362_g3466 ) - ( break2340_g3466.z * FUNC_Angle_SinA2424_g3466 ) ) , lerpResult2275_g3466));
				float3 VERTEX_POSITION2282_g3466 = ( mul( GetWorldToObjectMatrix(), float4( appendResult2235_g3466 , 0.0 ) ).xyz - inputMesh.positionOS );
				float3 break2518_g3466 = VERTEX_POSITION2282_g3466;
				half FUNC_SinFunction2336_g3466 = sin( ( ( _WIND_RANDOM_OFFSET2244_g3466 * 200.0 * ( 0.2 + inputMesh.ase_color.g ) ) + ( inputMesh.ase_color.g * 10.0 ) + _WIND_TUBULENCE_RANDOM2274_g3466 + ( VERTEX_POSITION_MATRIX2352_g3466.z / 2.0 ) ) );
				int m_switch2326_g3466 = WIND_MODE2462_g3466;
				float m_Off2326_g3466 = 1.0;
				float m_Global2326_g3466 = ( _GlobalTurbulenceInfluence * _Global_Wind_Main_Turbulence );
				float m_Local2326_g3466 = _LocalWindTurbulence;
				float localWind_Globalfloatswitch2326_g3466 = Wind_Globalfloatswitch( m_switch2326_g3466 , m_Off2326_g3466 , m_Global2326_g3466 , m_Local2326_g3466 );
				float _WIND_TUBULENCE2442_g3466 = localWind_Globalfloatswitch2326_g3466;
				float3 appendResult2480_g3466 = (float3(break2518_g3466.x , ( break2518_g3466.y + ( FUNC_SinFunction2336_g3466 * inputMesh.ase_color.b * ( FUNC_Angle2470_g3466 + ( _WIND_STRENGHT2400_g3466 / 200.0 ) ) * _WIND_TUBULENCE2442_g3466 ) ) , break2518_g3466.z));
				float3 VERTEX_LEAF2396_g3466 = appendResult2480_g3466;
				float3 m_Leaf2439_g3466 = VERTEX_LEAF2396_g3466;
				float3 VERTEX_PALM2310_g3466 = ( ( FUNC_SinFunction2336_g3466 * inputMesh.ase_color.b * ( FUNC_Angle2470_g3466 + ( _WIND_STRENGHT2400_g3466 / 200.0 ) ) * _WIND_TUBULENCE2442_g3466 ) + VERTEX_POSITION2282_g3466 );
				float3 m_Palm2439_g3466 = VERTEX_PALM2310_g3466;
				float3 break2486_g3466 = VERTEX_POSITION2282_g3466;
				float temp_output_2514_0_g3466 = ( FUNC_SinFunction2336_g3466 * inputMesh.ase_color.b * ( FUNC_Angle2470_g3466 + ( _WIND_STRENGHT2400_g3466 / 200.0 ) ) );
				float lerpResult2482_g3466 = lerp( 0.0 , temp_output_2514_0_g3466 , _WIND_DIRECTION_X2418_g3466);
				float lerpResult2484_g3466 = lerp( 0.0 , temp_output_2514_0_g3466 , _WIND_DIRECTION_Y2416_g3466);
				float3 appendResult2489_g3466 = (float3(( break2486_g3466.x + lerpResult2482_g3466 ) , break2486_g3466.y , ( break2486_g3466.z + lerpResult2484_g3466 )));
				float3 VERTEX_GRASS2242_g3466 = appendResult2489_g3466;
				float3 m_Grass2439_g3466 = VERTEX_GRASS2242_g3466;
				float3 m_Simple2439_g3466 = VERTEX_POSITION2282_g3466;
				float clampResult2884_g3466 = clamp( ( _WIND_STRENGHT2400_g3466 - 0.95 ) , 0.0 , 1.0 );
				float3 break2708_g3466 = VERTEX_POSITION2282_g3466;
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				float3 break2718_g3466 = ase_worldPos;
				float temp_output_2690_0_g3466 = ( _WIND_RANDOM_OFFSET2244_g3466 * 25.0 );
				float clampResult2691_g3466 = clamp( 25.0 , 0.2 , 0.25 );
				float2 appendResult2694_g3466 = (float2(temp_output_2690_0_g3466 , ( temp_output_2690_0_g3466 / clampResult2691_g3466 )));
				float3 appendResult2706_g3466 = (float3(break2708_g3466.x , ( break2708_g3466.y + cos( ( ( ( break2718_g3466.x + break2718_g3466.y + break2718_g3466.z ) * 2.0 ) + appendResult2694_g3466 + FUNC_Angle2470_g3466 + _WIND_TUBULENCE2442_g3466 ) ) ).x , break2708_g3466.z));
				float3 temp_output_2613_0_g3466 = ( clampResult2884_g3466 * appendResult2706_g3466 );
				float3 VERTEX_IVY997_g3466 = ( ( ( cos( temp_output_2613_0_g3466 ) + ( -0.3193 * PI ) ) * inputMesh.normalOS * 0.2 * ( FUNC_SinFunction2336_g3466 * inputMesh.ase_color.b ) ) + ( sin( temp_output_2613_0_g3466 ) * cross( inputMesh.normalOS , inputMesh.ase_tangent.xyz ) * 0.2 ) );
				float3 m_Ivy2439_g3466 = VERTEX_IVY997_g3466;
				float3 localWind_Typefloat3switch2439_g3466 = Wind_Typefloat3switch2439_g3466( m_switch2439_g3466 , m_Leaf2439_g3466 , m_Palm2439_g3466 , m_Grass2439_g3466 , m_Simple2439_g3466 , m_Ivy2439_g3466 );
				float3 m_Global2453_g3466 = localWind_Typefloat3switch2439_g3466;
				float3 m_Local2453_g3466 = localWind_Typefloat3switch2439_g3466;
				float3 localWind_Globalfloat3switch2453_g3466 = Wind_Globalfloat3switch( m_switch2453_g3466 , m_Off2453_g3466 , m_Global2453_g3466 , m_Local2453_g3466 );
				float3 m_Off3050_g3466 = localWind_Globalfloat3switch2453_g3466;
				float temp_output_3048_0_g3466 = saturate( pow( ( distance( _WorldSpaceCameraPos , ase_worldPos ) / _Global_Wind_Main_Fade_Bias ) , 5.0 ) );
				float3 m_ActiveFadeOut3050_g3466 = ( localWind_Globalfloat3switch2453_g3466 * ( 1.0 - temp_output_3048_0_g3466 ) );
				float3 m_ActiveFadeIn3050_g3466 = ( localWind_Globalfloat3switch2453_g3466 * temp_output_3048_0_g3466 );
				float3 localWind_Fadefloat3switch3050_g3466 = Wind_Fadefloat3switch3050_g3466( m_switch3050_g3466 , m_Off3050_g3466 , m_ActiveFadeOut3050_g3466 , m_ActiveFadeIn3050_g3466 );
				float3 temp_output_1234_0_g43431 = localWind_Fadefloat3switch3050_g3466;
				
				float3 ase_worldTangent = TransformObjectToWorldDir(inputMesh.ase_tangent.xyz);
				outputPackedVaryingsMeshToPS.ase_texcoord4.xyz = ase_worldTangent;
				float3 ase_worldNormal = TransformObjectToWorldNormal(inputMesh.normalOS);
				outputPackedVaryingsMeshToPS.ase_texcoord5.xyz = ase_worldNormal;
				float ase_vertexTangentSign = inputMesh.ase_tangent.w * unity_WorldTransformParams.w;
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				outputPackedVaryingsMeshToPS.ase_texcoord6.xyz = ase_worldBitangent;
				
				outputPackedVaryingsMeshToPS.ase_texcoord7.xyz = ase_worldPos;
				
				outputPackedVaryingsMeshToPS.ase_texcoord3.xy = inputMesh.ase_texcoord.xy;
				outputPackedVaryingsMeshToPS.ase_color = inputMesh.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord3.zw = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord4.w = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord5.w = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord6.w = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord7.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = temp_output_1234_0_g43431;

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
				float4 ase_tangent : TANGENT;
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
				o.ase_tangent = v.ase_tangent;
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
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
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
				float2 appendResult168_g43431 = (float2(_TilingX , _TilingY));
				float2 appendResult167_g43431 = (float2(_OffsetX , _OffsetY));
				float2 texCoord2_g43454 = packedInput.ase_texcoord3.xy * appendResult168_g43431 + appendResult167_g43431;
				float2 OUT_UV213_g43431 = texCoord2_g43454;
				float2 UV40_g43445 = OUT_UV213_g43431;
				float4 NORMAL_RGB1382_g43431 = SAMPLE_TEXTURE2D( _BumpMap, sampler_trilinear_repeat, UV40_g43445 );
				float4 temp_output_1_0_g43450 = NORMAL_RGB1382_g43431;
				float temp_output_8_0_g43450 = _NormalStrength;
				float3 unpack52_g43450 = UnpackNormalScale( temp_output_1_0_g43450, temp_output_8_0_g43450 );
				unpack52_g43450.z = lerp( 1, unpack52_g43450.z, saturate(temp_output_8_0_g43450) );
				float3 temp_output_1519_59_g43431 = unpack52_g43450;
				float3 NORMAL_IN42_g43456 = temp_output_1519_59_g43431;
				float3 temp_output_1610_30_g43431 = NORMAL_IN42_g43456;
				
				int temp_output_223_0_g43455 = _SmoothnessSource;
				int m_switch215_g43455 = temp_output_223_0_g43455;
				float4 MASK_G158_g43431 = SAMPLE_TEXTURE2D( _SmoothnessMap, sampler_trilinear_repeat, UV40_g43445 );
				float4 temp_cast_2 = (_SmoothnessMin).xxxx;
				float4 temp_cast_3 = (_SmoothnessMax).xxxx;
				float4 temp_output_216_0_g43455 = (temp_cast_2 + (MASK_G158_g43431 - float4( 0,0,0,0 )) * (temp_cast_3 - temp_cast_2) / (float4( 1,1,1,1 ) - float4( 0,0,0,0 )));
				float4 m_Smoothness215_g43455 = temp_output_216_0_g43455;
				float4 temp_cast_4 = (_SmoothnessMin).xxxx;
				float4 temp_cast_5 = (_SmoothnessMax).xxxx;
				float4 temp_output_214_0_g43455 = ( 1.0 - temp_output_216_0_g43455 );
				float4 m_Roughness215_g43455 = temp_output_214_0_g43455;
				float4 temp_cast_6 = (_SmoothnessMin).xxxx;
				float4 temp_cast_7 = (_SmoothnessMax).xxxx;
				float3 NORMAL_OUT1491_g43431 = temp_output_1610_30_g43431;
				float3 ase_worldTangent = packedInput.ase_texcoord4.xyz;
				float3 ase_worldNormal = packedInput.ase_texcoord5.xyz;
				float3 ase_worldBitangent = packedInput.ase_texcoord6.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal1608_g43431 = NORMAL_OUT1491_g43431;
				float3 worldNormal1608_g43431 = normalize( float3(dot(tanToWorld0,tanNormal1608_g43431), dot(tanToWorld1,tanNormal1608_g43431), dot(tanToWorld2,tanNormal1608_g43431)) );
				float3 temp_output_4_0_g43455 = worldNormal1608_g43431;
				float3 temp_output_178_0_g43455 = ddx( temp_output_4_0_g43455 );
				float dotResult195_g43455 = dot( temp_output_178_0_g43455 , temp_output_178_0_g43455 );
				float3 temp_output_175_0_g43455 = ddy( temp_output_4_0_g43455 );
				float dotResult201_g43455 = dot( temp_output_175_0_g43455 , temp_output_175_0_g43455 );
				float4 tex2DNode63_g43445 = SAMPLE_TEXTURE2D( _MainTex, sampler_trilinear_repeat, UV40_g43445 );
				float ALBEDO_R172_g43431 = tex2DNode63_g43445.r;
				float4 temp_cast_8 = (ALBEDO_R172_g43431).xxxx;
				float4 m_Geometric215_g43455 = ( sqrt( saturate( ( temp_output_216_0_g43455 + ( ( dotResult195_g43455 + dotResult201_g43455 ) * 2.0 ) ) ) ) * ( 1.0 - temp_cast_8 ) );
				float4 localSmoothnessTypefloat4switch215_g43455 = SmoothnessTypefloat4switch215_g43455( m_switch215_g43455 , m_Smoothness215_g43455 , m_Roughness215_g43455 , m_Geometric215_g43455 );
				float4 temp_output_1635_33_g43431 = localSmoothnessTypefloat4switch215_g43455;
				float4 PBR_Occlusion1712_g43431 = SAMPLE_TEXTURE2D( _OcclusionMap, sampler_trilinear_repeat, UV40_g43445 );
				float temp_output_16_0_g43444 = _OcclusionStrengthAO;
				float temp_output_65_0_g43444 = ( 1.0 - temp_output_16_0_g43444 );
				float3 appendResult69_g43444 = (float3(temp_output_65_0_g43444 , temp_output_65_0_g43444 , temp_output_65_0_g43444));
				float4 color77_g43444 = IsGammaSpace() ? float4(1,1,1,1) : float4(1,1,1,1);
				float4 temp_cast_11 = (packedInput.ase_color.a).xxxx;
				float4 lerpResult75_g43444 = lerp( color77_g43444 , temp_cast_11 , temp_output_16_0_g43444);
				float4 lerpResult83_g43444 = lerp( float4( ( ( ( (PBR_Occlusion1712_g43431).xyz - float3( 0.5,0.5,0.5 ) ) * temp_output_16_0_g43444 ) + appendResult69_g43444 ) , 0.0 ) , lerpResult75_g43444 , _OcclusionSource);
				float4 Occlusion1628_g43431 = saturate( lerpResult83_g43444 );
				
				float ALBEDO_A926_g43431 = tex2DNode63_g43445.a;
				float temp_output_1_0_g43439 = ALBEDO_A926_g43431;
				float temp_output_6_0_g43439 = ( step( _CustomCutoffAntialias , temp_output_1_0_g43439 ) - step( temp_output_1_0_g43439 , _CustomCutoffAntialias ) );
				float lerpResult10_g43439 = lerp( temp_output_1_0_g43439 , saturate( ( temp_output_6_0_g43439 / fwidth( temp_output_6_0_g43439 ) ) ) , _EnableCustomAntialias);
				float Albedo_Alpha52_g43443 = lerpResult10_g43439;
				float3 ase_worldPos = packedInput.ase_texcoord7.xyz;
				float3 normalizeResult38_g43443 = normalize( cross( ddx( ase_worldPos ) , ddy( ase_worldPos ) ) );
				float dotResult35_g43443 = dot( normalizeResult38_g43443 , V );
				float temp_output_32_0_g43443 = ( 1.0 - abs( dotResult35_g43443 ) );
				float lerpResult67_g43443 = lerp( 1.0 , ( 1.0 - ( temp_output_32_0_g43443 * temp_output_32_0_g43443 ) ) , _GlancingClipMode);
				float OpacityMask42_g43443 = lerpResult67_g43443;
				
				surfaceDescription.Normal = temp_output_1610_30_g43431;
				surfaceDescription.Smoothness = ( temp_output_1635_33_g43431 * Occlusion1628_g43431 ).x;
				surfaceDescription.Alpha = ( Albedo_Alpha52_g43443 * OpacityMask42_g43443 );

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = _Cutoff;
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
			#define _MATERIAL_FEATURE_TRANSMISSION 1
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
			float4 _ColorShift_MaskMap_ST;
			float4 _Smoothness;
			float4 _Color;
			float _DoubleSidedGIMode;
			float _ColorShift_ShiftSaturation;
			float _ColorShift_MaskFuzziness;
			float _ColorShift_ShiftInfluence;
			half _NormalStrength;
			int _NormalMapSpace;
			half _NormalStrengthBent;
			int _SmoothnessSource;
			float _OcclusionStrengthAO;
			float _OcclusionSource;
			float _CustomCutoffAntialias;
			float _EnableCustomAntialias;
			float _GlancingClipMode;
			float _Cutoff;
			float _AlphaCutoffShadow;
			float _SpecularAAScreenSpaceVariance;
			float _EnableGeometricSpecularAA;
			float _SpecularAAThreshold;
			float _SubsurfaceDistortionHDRP;
			float _SubsurfacePower;
			float _SubsurfaceIntensityHDRP;
			int _TranslucencySourceHDRP;
			float _TranslucencyThicknessFeather;
			float _TranslucencyThickness;
			float _TranslucentScatteringHDRP;
			float _ColorShift_ShiftVariationRGB;
			float _ColorShift_ShiftVariation;
			float _ColorShift_WorldSpaceDistance;
			float _ColorShift_WorldSpaceOffset;
			half _EmissionFlags;
			float _TransparentWritingMotionVec;
			float _EnableBlendModePreserveSpecularLighting;
			float _AlphaToMaskInspectorValue;
			int _OpaqueCullMode;
			float _SmoothnessMax;
			float _SmoothnessMin;
			int _WindMode;
			int _WindType;
			float _GlobalWindInfluenceOther;
			float _LocalWindStrength;
			float _LocalRandomWindOffset;
			float _LocalWindPulse;
			float _LocalWindDirection;
			float _GlobalTurbulenceInfluence;
			float _LocalWindTurbulence;
			int _ColorShift_Mode;
			float _TilingX;
			float _TilingY;
			float _OffsetX;
			float _OffsetY;
			half _Brightness;
			int _ColorShift_MaskMode;
			float _ColorShift_NoiseScale;
			float _ColorShift_WorldSpaceNoiseShift;
			float _EnableTranslucency;
			float _DiffusionProfileHash;
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
			float _Global_Wind_Main_Turbulence;
			float _Global_Wind_Main_Fade_Bias;
			TEXTURE2D(_MainTex);
			SAMPLER(sampler_trilinear_repeat);
			TEXTURE2D(_ColorShift_MaskMap);
			TEXTURE2D(_BumpMap);
			TEXTURE2D(_BentNormalMap);
			TEXTURE2D(_SmoothnessMap);
			TEXTURE2D(_OcclusionMap);
			TEXTURE2D(_TranslucencyMap);


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
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_TANGENT
			#define ASE_NEEDS_FRAG_RELATIVE_WORLD_POS
			#define ASE_NEEDS_FRAG_POSITION
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_COLOR
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
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
				float4 ase_texcoord3 : TEXCOORD3;
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
				float4 ase_texcoord8 : TEXCOORD8;
				float4 ase_color : COLOR;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord9 : TEXCOORD9;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};

			float4 mod289( float4 x )
			{
				return x - floor(x * (1.0 / 289.0)) * 289.0;
			}
			
			float4 perm( float4 x )
			{
				return mod289(((x * 34.0) + 1.0) * x);
			}
			
			float SimpleNoise3D( float3 p )
			{
				 float3 a = floor(p);
				    float3 d = p - a;
				    d = d * d * (3.0 - 2.0 * d);
				 float4 b = a.xxyy + float4(0.0, 1.0, 0.0, 1.0);
				    float4 k1 = perm(b.xyxy);
				 float4 k2 = perm(k1.xyxy + b.zzww);
				    float4 c = k2 + a.zzzz;
				    float4 k3 = perm(c);
				    float4 k4 = perm(c + 1.0);
				    float4 o1 = frac(k3 * (1.0 / 41.0));
				 float4 o2 = frac(k4 * (1.0 / 41.0));
				    float4 o3 = o2 * d.z + o1 * (1.0 - d.z);
				    float2 o4 = o3.yw * d.x + o3.xz * (1.0 - d.x);
				    return o4.y * d.y + o4.x * (1.0 - d.y);
			}
			
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
			
			float3 Wind_Typefloat3switch2439_g3466( int m_switch, float3 m_Leaf, float3 m_Palm, float3 m_Grass, float3 m_Simple, float3 m_Ivy )
			{
				if(m_switch ==0)
					return m_Leaf;
				else if(m_switch ==1)
					return m_Palm;
				else if(m_switch ==2)
					return m_Grass;
				else if(m_switch ==3)
					return m_Simple;
				else if(m_switch ==4)
					return m_Ivy;
				else
				return float3(0,0,0);
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
			
			float3 Wind_Fadefloat3switch3050_g3466( int m_switch, float3 m_Off, float3 m_ActiveFadeOut, float3 m_ActiveFadeIn )
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
			
			float3 HSVToRGB( float3 c )
			{
				float4 K = float4( 1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0 );
				float3 p = abs( frac( c.xxx + K.xyz ) * 6.0 - K.www );
				return c.z * lerp( K.xxx, saturate( p - K.xxx ), c.y );
			}
			
			float ColorShift_Modefloatswitch168_g43432( int m_switch, float m_Off, float m_ObjectSpace, float m_WorldSpace, float m_VertexColor, float m_VertexNormal )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_ObjectSpace;
				else if(m_switch ==2)
					return m_WorldSpace;
				else if(m_switch ==3)
					return m_VertexColor;
				else if(m_switch ==4)
					return m_VertexNormal;
				else
				return float(0);
			}
			
			float3 RGBToHSV(float3 c)
			{
				float4 K = float4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
				float4 p = lerp( float4( c.bg, K.wz ), float4( c.gb, K.xy ), step( c.b, c.g ) );
				float4 q = lerp( float4( p.xyw, c.r ), float4( c.r, p.yzx ), step( p.x, c.r ) );
				float d = q.x - min( q.w, q.y );
				float e = 1.0e-10;
				return float3( abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
			}
			float4 ColorShift_Maskfloat4switch313_g43432( int m_switch, float4 m_Off, float4 m_Active, float4 m_ActiveInverted )
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
			
			float4 ColorShift_Modefloat4switch364_g43432( int m_switch, float4 m_Off, float4 m_ObjectSpace, float4 m_WorldSpace, float4 m_VertexColor, float4 m_VertexNormal )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_ObjectSpace;
				else if(m_switch ==2)
					return m_WorldSpace;
				else if(m_switch ==3)
					return m_VertexColor;
				else if(m_switch ==4)
					return m_VertexNormal;
				else
				return float4(0,0,0,0);
			}
			
			float3 ASEUnpackNormalRGB(float4 PackedNormal, float Scale = 1.0 )
			{
				float3 normal;
				normal.xyz = PackedNormal.rgb * 2.0 - 1.0;
				normal.xy *= Scale;
				return normal;
			}
			
			float3 _BentNormal_Spacefloat3switch6_g43461( int m_switch, float3 m_TangentSpace, float3 m_ObjectSpace )
			{
				if(m_switch ==0)
					return m_TangentSpace;
				else if(m_switch ==1)
					return m_ObjectSpace;
				else
				return float3(0,0,0);
			}
			
			float4 SmoothnessTypefloat4switch215_g43455( int m_switch, float4 m_Smoothness, float4 m_Roughness, float4 m_Geometric )
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
			
			float4 float4switch38_g43448( int m_switch, float4 m_Texture, float4 m_TextureInverted, float4 m_Baked )
			{
				if(m_switch ==0)
					return m_Texture;
				else if(m_switch ==1)
					return m_TextureInverted;
				else if(m_switch ==2)
					return m_Baked;
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
				int m_switch3050_g3466 = _Global_Wind_Main_Fade_Enabled;
				int m_switch2453_g3466 = _WindMode;
				float3 m_Off2453_g3466 = float3(0,0,0);
				int m_switch2439_g3466 = _WindType;
				float3 VERTEX_POSITION_MATRIX2352_g3466 = mul( GetObjectToWorldMatrix(), float4( inputMesh.positionOS , 0.0 ) ).xyz;
				float3 break2265_g3466 = VERTEX_POSITION_MATRIX2352_g3466;
				int WIND_MODE2462_g3466 = _WindMode;
				int m_switch2458_g3466 = WIND_MODE2462_g3466;
				float m_Off2458_g3466 = 1.0;
				float m_Global2458_g3466 = ( _GlobalWindInfluenceOther * _Global_Wind_Main_Intensity );
				float m_Local2458_g3466 = _LocalWindStrength;
				float localWind_Globalfloatswitch2458_g3466 = Wind_Globalfloatswitch( m_switch2458_g3466 , m_Off2458_g3466 , m_Global2458_g3466 , m_Local2458_g3466 );
				float _WIND_STRENGHT2400_g3466 = localWind_Globalfloatswitch2458_g3466;
				int m_switch2468_g3466 = WIND_MODE2462_g3466;
				float m_Off2468_g3466 = 1.0;
				float m_Global2468_g3466 = _Global_Wind_Main_RandomOffset;
				float m_Local2468_g3466 = _LocalRandomWindOffset;
				float localWind_Globalfloatswitch2468_g3466 = Wind_Globalfloatswitch( m_switch2468_g3466 , m_Off2468_g3466 , m_Global2468_g3466 , m_Local2468_g3466 );
				float4 transform3073_g3466 = mul(GetObjectToWorldMatrix(),float4( 0,0,0,1 ));
				transform3073_g3466.xyz = GetAbsolutePositionWS((transform3073_g3466).xyz);
				float2 appendResult2307_g3466 = (float2(transform3073_g3466.x , transform3073_g3466.z));
				float dotResult2341_g3466 = dot( appendResult2307_g3466 , float2( 12.9898,78.233 ) );
				float lerpResult2238_g3466 = lerp( 0.8 , ( ( localWind_Globalfloatswitch2468_g3466 / 2.0 ) + 0.9 ) , frac( ( sin( dotResult2341_g3466 ) * 43758.55 ) ));
				float _WIND_RANDOM_OFFSET2244_g3466 = ( ( _TimeParameters.x * 0.05 ) * lerpResult2238_g3466 );
				float _WIND_TUBULENCE_RANDOM2274_g3466 = ( sin( ( ( _WIND_RANDOM_OFFSET2244_g3466 * 40.0 ) - ( VERTEX_POSITION_MATRIX2352_g3466.z / 15.0 ) ) ) * 0.5 );
				int m_switch2312_g3466 = WIND_MODE2462_g3466;
				float m_Off2312_g3466 = 1.0;
				float m_Global2312_g3466 = _Global_Wind_Main_Pulse;
				float m_Local2312_g3466 = _LocalWindPulse;
				float localWind_Globalfloatswitch2312_g3466 = Wind_Globalfloatswitch( m_switch2312_g3466 , m_Off2312_g3466 , m_Global2312_g3466 , m_Local2312_g3466 );
				float _WIND_PULSE2421_g3466 = localWind_Globalfloatswitch2312_g3466;
				float FUNC_Angle2470_g3466 = ( _WIND_STRENGHT2400_g3466 * ( 1.0 + sin( ( ( ( ( _WIND_RANDOM_OFFSET2244_g3466 * 2.0 ) + _WIND_TUBULENCE_RANDOM2274_g3466 ) - ( VERTEX_POSITION_MATRIX2352_g3466.z / 50.0 ) ) - ( inputMesh.ase_color.r / 20.0 ) ) ) ) * sqrt( inputMesh.ase_color.r ) * _WIND_PULSE2421_g3466 );
				float FUNC_Angle_SinA2424_g3466 = sin( FUNC_Angle2470_g3466 );
				float FUNC_Angle_CosA2362_g3466 = cos( FUNC_Angle2470_g3466 );
				int m_switch2456_g3466 = WIND_MODE2462_g3466;
				float m_Off2456_g3466 = 1.0;
				float m_Global2456_g3466 = _Global_Wind_Main_Direction;
				float m_Local2456_g3466 = _LocalWindDirection;
				float localWind_Globalfloatswitch2456_g3466 = Wind_Globalfloatswitch( m_switch2456_g3466 , m_Off2456_g3466 , m_Global2456_g3466 , m_Local2456_g3466 );
				float _WindDirection2249_g3466 = localWind_Globalfloatswitch2456_g3466;
				float2 localDirectionalEquation2249_g3466 = DirectionalEquation( _WindDirection2249_g3466 );
				float2 break2469_g3466 = localDirectionalEquation2249_g3466;
				float _WIND_DIRECTION_X2418_g3466 = break2469_g3466.x;
				float lerpResult2258_g3466 = lerp( break2265_g3466.x , ( ( break2265_g3466.y * FUNC_Angle_SinA2424_g3466 ) + ( break2265_g3466.x * FUNC_Angle_CosA2362_g3466 ) ) , _WIND_DIRECTION_X2418_g3466);
				float3 break2340_g3466 = VERTEX_POSITION_MATRIX2352_g3466;
				float3 break2233_g3466 = VERTEX_POSITION_MATRIX2352_g3466;
				float _WIND_DIRECTION_Y2416_g3466 = break2469_g3466.y;
				float lerpResult2275_g3466 = lerp( break2233_g3466.z , ( ( break2233_g3466.y * FUNC_Angle_SinA2424_g3466 ) + ( break2233_g3466.z * FUNC_Angle_CosA2362_g3466 ) ) , _WIND_DIRECTION_Y2416_g3466);
				float3 appendResult2235_g3466 = (float3(lerpResult2258_g3466 , ( ( break2340_g3466.y * FUNC_Angle_CosA2362_g3466 ) - ( break2340_g3466.z * FUNC_Angle_SinA2424_g3466 ) ) , lerpResult2275_g3466));
				float3 VERTEX_POSITION2282_g3466 = ( mul( GetWorldToObjectMatrix(), float4( appendResult2235_g3466 , 0.0 ) ).xyz - inputMesh.positionOS );
				float3 break2518_g3466 = VERTEX_POSITION2282_g3466;
				half FUNC_SinFunction2336_g3466 = sin( ( ( _WIND_RANDOM_OFFSET2244_g3466 * 200.0 * ( 0.2 + inputMesh.ase_color.g ) ) + ( inputMesh.ase_color.g * 10.0 ) + _WIND_TUBULENCE_RANDOM2274_g3466 + ( VERTEX_POSITION_MATRIX2352_g3466.z / 2.0 ) ) );
				int m_switch2326_g3466 = WIND_MODE2462_g3466;
				float m_Off2326_g3466 = 1.0;
				float m_Global2326_g3466 = ( _GlobalTurbulenceInfluence * _Global_Wind_Main_Turbulence );
				float m_Local2326_g3466 = _LocalWindTurbulence;
				float localWind_Globalfloatswitch2326_g3466 = Wind_Globalfloatswitch( m_switch2326_g3466 , m_Off2326_g3466 , m_Global2326_g3466 , m_Local2326_g3466 );
				float _WIND_TUBULENCE2442_g3466 = localWind_Globalfloatswitch2326_g3466;
				float3 appendResult2480_g3466 = (float3(break2518_g3466.x , ( break2518_g3466.y + ( FUNC_SinFunction2336_g3466 * inputMesh.ase_color.b * ( FUNC_Angle2470_g3466 + ( _WIND_STRENGHT2400_g3466 / 200.0 ) ) * _WIND_TUBULENCE2442_g3466 ) ) , break2518_g3466.z));
				float3 VERTEX_LEAF2396_g3466 = appendResult2480_g3466;
				float3 m_Leaf2439_g3466 = VERTEX_LEAF2396_g3466;
				float3 VERTEX_PALM2310_g3466 = ( ( FUNC_SinFunction2336_g3466 * inputMesh.ase_color.b * ( FUNC_Angle2470_g3466 + ( _WIND_STRENGHT2400_g3466 / 200.0 ) ) * _WIND_TUBULENCE2442_g3466 ) + VERTEX_POSITION2282_g3466 );
				float3 m_Palm2439_g3466 = VERTEX_PALM2310_g3466;
				float3 break2486_g3466 = VERTEX_POSITION2282_g3466;
				float temp_output_2514_0_g3466 = ( FUNC_SinFunction2336_g3466 * inputMesh.ase_color.b * ( FUNC_Angle2470_g3466 + ( _WIND_STRENGHT2400_g3466 / 200.0 ) ) );
				float lerpResult2482_g3466 = lerp( 0.0 , temp_output_2514_0_g3466 , _WIND_DIRECTION_X2418_g3466);
				float lerpResult2484_g3466 = lerp( 0.0 , temp_output_2514_0_g3466 , _WIND_DIRECTION_Y2416_g3466);
				float3 appendResult2489_g3466 = (float3(( break2486_g3466.x + lerpResult2482_g3466 ) , break2486_g3466.y , ( break2486_g3466.z + lerpResult2484_g3466 )));
				float3 VERTEX_GRASS2242_g3466 = appendResult2489_g3466;
				float3 m_Grass2439_g3466 = VERTEX_GRASS2242_g3466;
				float3 m_Simple2439_g3466 = VERTEX_POSITION2282_g3466;
				float clampResult2884_g3466 = clamp( ( _WIND_STRENGHT2400_g3466 - 0.95 ) , 0.0 , 1.0 );
				float3 break2708_g3466 = VERTEX_POSITION2282_g3466;
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				float3 break2718_g3466 = ase_worldPos;
				float temp_output_2690_0_g3466 = ( _WIND_RANDOM_OFFSET2244_g3466 * 25.0 );
				float clampResult2691_g3466 = clamp( 25.0 , 0.2 , 0.25 );
				float2 appendResult2694_g3466 = (float2(temp_output_2690_0_g3466 , ( temp_output_2690_0_g3466 / clampResult2691_g3466 )));
				float3 appendResult2706_g3466 = (float3(break2708_g3466.x , ( break2708_g3466.y + cos( ( ( ( break2718_g3466.x + break2718_g3466.y + break2718_g3466.z ) * 2.0 ) + appendResult2694_g3466 + FUNC_Angle2470_g3466 + _WIND_TUBULENCE2442_g3466 ) ) ).x , break2708_g3466.z));
				float3 temp_output_2613_0_g3466 = ( clampResult2884_g3466 * appendResult2706_g3466 );
				float3 VERTEX_IVY997_g3466 = ( ( ( cos( temp_output_2613_0_g3466 ) + ( -0.3193 * PI ) ) * inputMesh.normalOS * 0.2 * ( FUNC_SinFunction2336_g3466 * inputMesh.ase_color.b ) ) + ( sin( temp_output_2613_0_g3466 ) * cross( inputMesh.normalOS , inputMesh.tangentOS.xyz ) * 0.2 ) );
				float3 m_Ivy2439_g3466 = VERTEX_IVY997_g3466;
				float3 localWind_Typefloat3switch2439_g3466 = Wind_Typefloat3switch2439_g3466( m_switch2439_g3466 , m_Leaf2439_g3466 , m_Palm2439_g3466 , m_Grass2439_g3466 , m_Simple2439_g3466 , m_Ivy2439_g3466 );
				float3 m_Global2453_g3466 = localWind_Typefloat3switch2439_g3466;
				float3 m_Local2453_g3466 = localWind_Typefloat3switch2439_g3466;
				float3 localWind_Globalfloat3switch2453_g3466 = Wind_Globalfloat3switch( m_switch2453_g3466 , m_Off2453_g3466 , m_Global2453_g3466 , m_Local2453_g3466 );
				float3 m_Off3050_g3466 = localWind_Globalfloat3switch2453_g3466;
				float temp_output_3048_0_g3466 = saturate( pow( ( distance( _WorldSpaceCameraPos , ase_worldPos ) / _Global_Wind_Main_Fade_Bias ) , 5.0 ) );
				float3 m_ActiveFadeOut3050_g3466 = ( localWind_Globalfloat3switch2453_g3466 * ( 1.0 - temp_output_3048_0_g3466 ) );
				float3 m_ActiveFadeIn3050_g3466 = ( localWind_Globalfloat3switch2453_g3466 * temp_output_3048_0_g3466 );
				float3 localWind_Fadefloat3switch3050_g3466 = Wind_Fadefloat3switch3050_g3466( m_switch3050_g3466 , m_Off3050_g3466 , m_ActiveFadeOut3050_g3466 , m_ActiveFadeIn3050_g3466 );
				float3 temp_output_1234_0_g43431 = localWind_Fadefloat3switch3050_g3466;
				
				float3 ase_worldNormal = TransformObjectToWorldNormal(inputMesh.normalOS);
				float3 ase_worldTangent = TransformObjectToWorldDir(inputMesh.tangentOS.xyz);
				float ase_vertexTangentSign = inputMesh.tangentOS.w * unity_WorldTransformParams.w;
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				outputPackedVaryingsMeshToPS.ase_texcoord9.xyz = ase_worldBitangent;
				
				outputPackedVaryingsMeshToPS.ase_texcoord7.xy = inputMesh.ase_texcoord.xy;
				outputPackedVaryingsMeshToPS.ase_texcoord8 = float4(inputMesh.positionOS,1);
				outputPackedVaryingsMeshToPS.ase_color = inputMesh.ase_color;
				outputPackedVaryingsMeshToPS.ase_normal = inputMesh.normalOS;
				outputPackedVaryingsMeshToPS.ase_texcoord7.zw = inputMesh.ase_texcoord3.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord9.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = temp_output_1234_0_g43431;

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
				float4 ase_texcoord3 : TEXCOORD3;

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
				o.ase_texcoord3 = v.ase_texcoord3;
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
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
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
				int m_switch364_g43432 = _ColorShift_Mode;
				float2 appendResult168_g43431 = (float2(_TilingX , _TilingY));
				float2 appendResult167_g43431 = (float2(_OffsetX , _OffsetY));
				float2 texCoord2_g43454 = packedInput.ase_texcoord7.xy * appendResult168_g43431 + appendResult167_g43431;
				float2 OUT_UV213_g43431 = texCoord2_g43454;
				float2 UV40_g43445 = OUT_UV213_g43431;
				float4 tex2DNode63_g43445 = SAMPLE_TEXTURE2D( _MainTex, sampler_trilinear_repeat, UV40_g43445 );
				float4 ALBEDO_RGBA1381_g43431 = tex2DNode63_g43445;
				float3 temp_output_3_0_g43431 = ( (_Color).rgb * (ALBEDO_RGBA1381_g43431).rgb * _Brightness );
				float3 temp_output_134_0_g43432 = temp_output_3_0_g43431;
				float4 m_Off364_g43432 = float4( temp_output_134_0_g43432 , 0.0 );
				int m_switch313_g43432 = _ColorShift_MaskMode;
				int MODE176_g43432 = _ColorShift_Mode;
				int m_switch168_g43432 = MODE176_g43432;
				float m_Off168_g43432 = 0.0;
				float m_ObjectSpace168_g43432 = ( _ColorShift_NoiseScale / 3 );
				float3 ase_worldPos = GetAbsolutePositionWS( positionRWS );
				float3 p1_g43433 = ( ase_worldPos * _ColorShift_WorldSpaceNoiseShift );
				float localSimpleNoise3D1_g43433 = SimpleNoise3D( p1_g43433 );
				float4 transform374_g43432 = mul(GetObjectToWorldMatrix(),packedInput.ase_texcoord8);
				transform374_g43432.xyz = GetAbsolutePositionWS((transform374_g43432).xyz);
				float m_WorldSpace168_g43432 = ( ( localSimpleNoise3D1_g43433 / _ColorShift_NoiseScale ) - ( ( (transform374_g43432).w - _ColorShift_WorldSpaceOffset ) / _ColorShift_WorldSpaceDistance ) );
				float m_VertexColor168_g43432 = ( packedInput.ase_color.g - 0.5 );
				float m_VertexNormal168_g43432 = ( packedInput.ase_normal.y - 0.5 );
				float localColorShift_Modefloatswitch168_g43432 = ColorShift_Modefloatswitch168_g43432( m_switch168_g43432 , m_Off168_g43432 , m_ObjectSpace168_g43432 , m_WorldSpace168_g43432 , m_VertexColor168_g43432 , m_VertexNormal168_g43432 );
				float temp_output_112_0_g43432 = sin( ( _ColorShift_NoiseScale * PI ) );
				float3 ALBEDO_IN136_g43432 = temp_output_134_0_g43432;
				float2 appendResult120_g43432 = (float2(( (0.3 + (( 1.0 - temp_output_112_0_g43432 ) - 0.0) * (1.0 - 0.3) / (1.0 - 0.0)) * float4( ALBEDO_IN136_g43432 , 0.0 ).x ) , 0.0));
				float2 RGB146_g43432 = appendResult120_g43432;
				float3 hsvTorgb122_g43432 = RGBToHSV( float3( RGB146_g43432 ,  0.0 ) );
				float VALUE219_g43432 = temp_output_112_0_g43432;
				float3 hsvTorgb126_g43432 = HSVToRGB( float3(( ( saturate( localColorShift_Modefloatswitch168_g43432 ) * _ColorShift_ShiftVariation ) + _ColorShift_ShiftVariationRGB + hsvTorgb122_g43432 ).x,( _ColorShift_ShiftSaturation * hsvTorgb122_g43432.y ),( hsvTorgb122_g43432.z + ( VALUE219_g43432 / 40 ) )) );
				float4 m_Off313_g43432 = float4( hsvTorgb126_g43432 , 0.0 );
				float2 uv_ColorShift_MaskMap = packedInput.ase_texcoord7.xy * _ColorShift_MaskMap_ST.xy + _ColorShift_MaskMap_ST.zw;
				float4 transform376_g43432 = mul(GetObjectToWorldMatrix(),float4( packedInput.ase_texcoord8.xyz , 0.0 ));
				transform376_g43432.xyz = GetAbsolutePositionWS((transform376_g43432).xyz);
				float4 temp_output_337_0_g43432 = saturate( ( 1.0 - ( ( SAMPLE_TEXTURE2D( _ColorShift_MaskMap, sampler_trilinear_repeat, uv_ColorShift_MaskMap ) * transform376_g43432 ) / max( _ColorShift_MaskFuzziness , 1E-05 ) ) ) );
				float3 lerpResult314_g43432 = lerp( hsvTorgb126_g43432 , ALBEDO_IN136_g43432 , temp_output_337_0_g43432.rgb);
				float4 m_Active313_g43432 = float4( lerpResult314_g43432 , 0.0 );
				float3 lerpResult311_g43432 = lerp( ALBEDO_IN136_g43432 , hsvTorgb126_g43432 , temp_output_337_0_g43432.rgb);
				float4 m_ActiveInverted313_g43432 = float4( lerpResult311_g43432 , 0.0 );
				float4 localColorShift_Maskfloat4switch313_g43432 = ColorShift_Maskfloat4switch313_g43432( m_switch313_g43432 , m_Off313_g43432 , m_Active313_g43432 , m_ActiveInverted313_g43432 );
				float4 lerpResult297_g43432 = lerp( float4( temp_output_134_0_g43432 , 0.0 ) , localColorShift_Maskfloat4switch313_g43432 , _ColorShift_ShiftInfluence);
				float4 m_ObjectSpace364_g43432 = lerpResult297_g43432;
				float4 m_WorldSpace364_g43432 = lerpResult297_g43432;
				float4 m_VertexColor364_g43432 = lerpResult297_g43432;
				float4 m_VertexNormal364_g43432 = lerpResult297_g43432;
				float4 localColorShift_Modefloat4switch364_g43432 = ColorShift_Modefloat4switch364_g43432( m_switch364_g43432 , m_Off364_g43432 , m_ObjectSpace364_g43432 , m_WorldSpace364_g43432 , m_VertexColor364_g43432 , m_VertexNormal364_g43432 );
				
				float4 NORMAL_RGB1382_g43431 = SAMPLE_TEXTURE2D( _BumpMap, sampler_trilinear_repeat, UV40_g43445 );
				float4 temp_output_1_0_g43450 = NORMAL_RGB1382_g43431;
				float temp_output_8_0_g43450 = _NormalStrength;
				float3 unpack52_g43450 = UnpackNormalScale( temp_output_1_0_g43450, temp_output_8_0_g43450 );
				unpack52_g43450.z = lerp( 1, unpack52_g43450.z, saturate(temp_output_8_0_g43450) );
				float3 temp_output_1519_59_g43431 = unpack52_g43450;
				float3 NORMAL_IN42_g43456 = temp_output_1519_59_g43431;
				float3 temp_output_1610_30_g43431 = NORMAL_IN42_g43456;
				
				int m_switch6_g43461 = _NormalMapSpace;
				float2 texCoord16_g43461 = packedInput.ase_texcoord7.xy * float2( 1,1 ) + float2( 0,0 );
				float4 temp_output_1_0_g43463 = SAMPLE_TEXTURE2D( _BentNormalMap, sampler_trilinear_repeat, texCoord16_g43461 );
				float temp_output_8_0_g43463 = _NormalStrengthBent;
				float3 unpack52_g43463 = UnpackNormalScale( temp_output_1_0_g43463, temp_output_8_0_g43463 );
				unpack52_g43463.z = lerp( 1, unpack52_g43463.z, saturate(temp_output_8_0_g43463) );
				float3 m_TangentSpace6_g43461 = unpack52_g43463;
				float temp_output_74_0_g43463 = ( 1.0 - temp_output_8_0_g43463 );
				float3 m_ObjectSpace6_g43461 = ASEUnpackNormalRGB(temp_output_1_0_g43463,temp_output_74_0_g43463);
				float3 local_BentNormal_Spacefloat3switch6_g43461 = _BentNormal_Spacefloat3switch6_g43461( m_switch6_g43461 , m_TangentSpace6_g43461 , m_ObjectSpace6_g43461 );
				
				int temp_output_223_0_g43455 = _SmoothnessSource;
				int m_switch215_g43455 = temp_output_223_0_g43455;
				float4 MASK_G158_g43431 = SAMPLE_TEXTURE2D( _SmoothnessMap, sampler_trilinear_repeat, UV40_g43445 );
				float4 temp_cast_16 = (_SmoothnessMin).xxxx;
				float4 temp_cast_17 = (_SmoothnessMax).xxxx;
				float4 temp_output_216_0_g43455 = (temp_cast_16 + (MASK_G158_g43431 - float4( 0,0,0,0 )) * (temp_cast_17 - temp_cast_16) / (float4( 1,1,1,1 ) - float4( 0,0,0,0 )));
				float4 m_Smoothness215_g43455 = temp_output_216_0_g43455;
				float4 temp_cast_18 = (_SmoothnessMin).xxxx;
				float4 temp_cast_19 = (_SmoothnessMax).xxxx;
				float4 temp_output_214_0_g43455 = ( 1.0 - temp_output_216_0_g43455 );
				float4 m_Roughness215_g43455 = temp_output_214_0_g43455;
				float4 temp_cast_20 = (_SmoothnessMin).xxxx;
				float4 temp_cast_21 = (_SmoothnessMax).xxxx;
				float3 NORMAL_OUT1491_g43431 = temp_output_1610_30_g43431;
				float3 ase_worldBitangent = packedInput.ase_texcoord9.xyz;
				float3 tanToWorld0 = float3( tangentWS.xyz.x, ase_worldBitangent.x, normalWS.x );
				float3 tanToWorld1 = float3( tangentWS.xyz.y, ase_worldBitangent.y, normalWS.y );
				float3 tanToWorld2 = float3( tangentWS.xyz.z, ase_worldBitangent.z, normalWS.z );
				float3 tanNormal1608_g43431 = NORMAL_OUT1491_g43431;
				float3 worldNormal1608_g43431 = normalize( float3(dot(tanToWorld0,tanNormal1608_g43431), dot(tanToWorld1,tanNormal1608_g43431), dot(tanToWorld2,tanNormal1608_g43431)) );
				float3 temp_output_4_0_g43455 = worldNormal1608_g43431;
				float3 temp_output_178_0_g43455 = ddx( temp_output_4_0_g43455 );
				float dotResult195_g43455 = dot( temp_output_178_0_g43455 , temp_output_178_0_g43455 );
				float3 temp_output_175_0_g43455 = ddy( temp_output_4_0_g43455 );
				float dotResult201_g43455 = dot( temp_output_175_0_g43455 , temp_output_175_0_g43455 );
				float ALBEDO_R172_g43431 = tex2DNode63_g43445.r;
				float4 temp_cast_22 = (ALBEDO_R172_g43431).xxxx;
				float4 m_Geometric215_g43455 = ( sqrt( saturate( ( temp_output_216_0_g43455 + ( ( dotResult195_g43455 + dotResult201_g43455 ) * 2.0 ) ) ) ) * ( 1.0 - temp_cast_22 ) );
				float4 localSmoothnessTypefloat4switch215_g43455 = SmoothnessTypefloat4switch215_g43455( m_switch215_g43455 , m_Smoothness215_g43455 , m_Roughness215_g43455 , m_Geometric215_g43455 );
				float4 temp_output_1635_33_g43431 = localSmoothnessTypefloat4switch215_g43455;
				float4 PBR_Occlusion1712_g43431 = SAMPLE_TEXTURE2D( _OcclusionMap, sampler_trilinear_repeat, UV40_g43445 );
				float temp_output_16_0_g43444 = _OcclusionStrengthAO;
				float temp_output_65_0_g43444 = ( 1.0 - temp_output_16_0_g43444 );
				float3 appendResult69_g43444 = (float3(temp_output_65_0_g43444 , temp_output_65_0_g43444 , temp_output_65_0_g43444));
				float4 color77_g43444 = IsGammaSpace() ? float4(1,1,1,1) : float4(1,1,1,1);
				float4 temp_cast_25 = (packedInput.ase_color.a).xxxx;
				float4 lerpResult75_g43444 = lerp( color77_g43444 , temp_cast_25 , temp_output_16_0_g43444);
				float4 lerpResult83_g43444 = lerp( float4( ( ( ( (PBR_Occlusion1712_g43431).xyz - float3( 0.5,0.5,0.5 ) ) * temp_output_16_0_g43444 ) + appendResult69_g43444 ) , 0.0 ) , lerpResult75_g43444 , _OcclusionSource);
				float4 Occlusion1628_g43431 = saturate( lerpResult83_g43444 );
				
				float ALBEDO_A926_g43431 = tex2DNode63_g43445.a;
				float temp_output_1_0_g43439 = ALBEDO_A926_g43431;
				float temp_output_6_0_g43439 = ( step( _CustomCutoffAntialias , temp_output_1_0_g43439 ) - step( temp_output_1_0_g43439 , _CustomCutoffAntialias ) );
				float lerpResult10_g43439 = lerp( temp_output_1_0_g43439 , saturate( ( temp_output_6_0_g43439 / fwidth( temp_output_6_0_g43439 ) ) ) , _EnableCustomAntialias);
				float Albedo_Alpha52_g43443 = lerpResult10_g43439;
				float3 normalizeResult38_g43443 = normalize( cross( ddx( ase_worldPos ) , ddy( ase_worldPos ) ) );
				float dotResult35_g43443 = dot( normalizeResult38_g43443 , V );
				float temp_output_32_0_g43443 = ( 1.0 - abs( dotResult35_g43443 ) );
				float lerpResult67_g43443 = lerp( 1.0 , ( 1.0 - ( temp_output_32_0_g43443 * temp_output_32_0_g43443 ) ) , _GlancingClipMode);
				float OpacityMask42_g43443 = lerpResult67_g43443;
				
				float lerpResult3_g43466 = lerp( 0.0 , _SpecularAAScreenSpaceVariance , _EnableGeometricSpecularAA);
				
				float lerpResult4_g43466 = lerp( 0.0 , _SpecularAAThreshold , _EnableGeometricSpecularAA);
				
				float3 tanNormal1607_g43431 = NORMAL_OUT1491_g43431;
				float3 worldNormal1607_g43431 = float3(dot(tanToWorld0,tanNormal1607_g43431), dot(tanToWorld1,tanNormal1607_g43431), dot(tanToWorld2,tanNormal1607_g43431));
				float3 temp_output_68_0_g43448 = ( worldNormal1607_g43431 * ( 1.0 - _SubsurfaceDistortionHDRP ) );
				float3 normalizeResult63_g43448 = normalize( ( -( -_DirectionalLightDatas[0].forward + temp_output_68_0_g43448 ) * temp_output_68_0_g43448 ) );
				float dotResult74_g43448 = dot( V , normalizeResult63_g43448 );
				int m_switch38_g43448 = _TranslucencySourceHDRP;
				float4 color71_g43448 = IsGammaSpace() ? float4(0,0,0,0) : float4(0,0,0,0);
				float4 temp_output_115_0_g43448 = saturate( ( SAMPLE_TEXTURE2D( _TranslucencyMap, sampler_trilinear_repeat, OUT_UV213_g43431 ) / max( _TranslucencyThicknessFeather , 1E-05 ) ) );
				float4 lerpResult34_g43448 = lerp( color71_g43448 , temp_output_115_0_g43448 , _TranslucencyThickness);
				float4 m_Texture38_g43448 = lerpResult34_g43448;
				float temp_output_69_0_g43448 = ( 0.0 - 1.0 );
				float temp_output_22_0_g43448 = ( temp_output_115_0_g43448.r - 1.0 );
				float lerpResult66_g43448 = lerp( ( temp_output_69_0_g43448 / temp_output_22_0_g43448 ) , ( temp_output_22_0_g43448 / temp_output_69_0_g43448 ) , ( 0.7 + _TranslucencyThickness ));
				float4 temp_cast_30 = (saturate( lerpResult66_g43448 )).xxxx;
				float4 m_TextureInverted38_g43448 = temp_cast_30;
				float lerpResult30_g43448 = lerp( 0.0 , ( 5.0 - packedInput.ase_texcoord7.zw.x ) , _TranslucencyThickness);
				float4 temp_cast_31 = (lerpResult30_g43448).xxxx;
				float4 m_Baked38_g43448 = temp_cast_31;
				float4 localfloat4switch38_g43448 = float4switch38_g43448( m_switch38_g43448 , m_Texture38_g43448 , m_TextureInverted38_g43448 , m_Baked38_g43448 );
				float4 lerpResult119_g43448 = lerp( float4( 0,0,0,0 ) , ( saturate( ( pow( saturate( max( dotResult74_g43448 , 0.0 ) ) , _SubsurfacePower ) * ( 1.0 - _SubsurfaceIntensityHDRP ) ) ) + ( localfloat4switch38_g43448 * ( 1.0 - _TranslucentScatteringHDRP ) ) ) , _EnableTranslucency);
				
				surfaceDescription.Albedo = ( localColorShift_Modefloat4switch364_g43432 + float4(0,0,0,0) ).xyz;
				surfaceDescription.Normal = temp_output_1610_30_g43431;
				surfaceDescription.BentNormal = local_BentNormal_Spacefloat3switch6_g43461;
				surfaceDescription.CoatMask = 0;
				surfaceDescription.Metallic = 0;

				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceDescription.Specular = 0;
				#endif

				surfaceDescription.Emission = 0;
				surfaceDescription.Smoothness = ( temp_output_1635_33_g43431 * Occlusion1628_g43431 ).x;
				surfaceDescription.Occlusion = saturate( lerpResult83_g43444 ).r;
				surfaceDescription.Alpha = ( Albedo_Alpha52_g43443 * OpacityMask42_g43443 );

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = _Cutoff;
				#endif

				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
				surfaceDescription.SpecularAAScreenSpaceVariance = lerpResult3_g43466;
				surfaceDescription.SpecularAAThreshold = lerpResult4_g43466;
				#endif

				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceDescription.SpecularOcclusion = 0;
				#endif

				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceDescription.Thickness = lerpResult119_g43448.x;
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
				surfaceDescription.DiffusionProfile = _DiffusionProfileHash;
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
122.5;60.5;1730;792;4997.75;3834.23;1;True;False
Node;AmplifyShaderEditor.CommentaryNode;2979;-3965.402,-3193.671;Inherit;False;289.6667;111;DESF Utility ASE Compile Shaders;1;2980;;0,0.1964631,1,1;0;0
Node;AmplifyShaderEditor.FunctionNode;2976;-4678.051,-3631.144;Inherit;False;DESF Module Wind;138;;3466;b135a554f7e4d0b41bba02c61b34ae74;11,2881,0,938,0,2457,1,2432,1,2434,1,2433,1,2371,1,2454,1,2752,0,2995,0,2878,0;0;2;FLOAT3;2190;FLOAT4;2970
Node;AmplifyShaderEditor.FunctionNode;2987;-3963.313,-3702.361;Inherit;False;DESF HDRP GUI 10x Surface Options;0;;43429;9785ff510f7360145a0c7695329a0dc0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;2980;-3960.402,-3156.671;Inherit;False;DESF Utility ASE Compile Shaders;-1;;43430;b85b01c42ba8a8a448b731b68fc0dbd9;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;2982;-4453.342,-3632.496;Inherit;False;DESF Core Cutout;20;;43431;e0cdd7758f4404849b063afff4596424;20,442,1,1217,1,1509,1,1749,1,1556,1,1557,1,1798,1,1618,0,1333,0,1663,0,1650,0,1647,0,1368,0,1569,0,96,2,830,0,1415,0,1565,0,1399,0,1564,0;2;1234;FLOAT3;0,0,0;False;1274;FLOAT4;0,0,0,0;False;12;FLOAT4;38;FLOAT3;35;FLOAT;37;FLOAT4;33;COLOR;34;FLOAT;46;FLOAT;814;FLOAT;1660;COLOR;656;COLOR;657;FLOAT4;655;FLOAT3;1235
Node;AmplifyShaderEditor.FunctionNode;2984;-4307.757,-3708.228;Inherit;False;DESF HDRP Bent Normal;134;;43461;0d561670847beae4e873b0b6acde227b;0;0;1;FLOAT3;9
Node;AmplifyShaderEditor.FunctionNode;2986;-4408.565,-3300.57;Inherit;False;DESF HDRP Alpha Clip Threshold Shadow;11;;43464;022626164a79e9542a55b37bef6515ec;1,32,0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;2985;-4375.756,-3230.978;Inherit;False;DESF HDRP Specular Geometric AA;7;;43466;1633571edcb81ad4a8487f62df12fd33;0;0;2;FLOAT;0;FLOAT;1
Node;AmplifyShaderEditor.FunctionNode;2983;-4329.345,-3137.714;Inherit;False;DESF HDRP Diffusion Profile;132;;43467;12dafefa9f3ab6a4481e7ae6f45ff562;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2960;-3941.374,-3630.745;Float;False;False;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;2;New Amplify Shader;53b46d85872c5b24c8f4f0a1c3fe4c87;True;META;0;1;META;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;;0;0;Standard;0;True;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2967;-3941.374,-3630.745;Float;False;False;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;2;New Amplify Shader;53b46d85872c5b24c8f4f0a1c3fe4c87;True;TransparentDepthPrepass;0;8;TransparentDepthPrepass;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;True;1;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;-25;False;False;False;False;False;False;False;False;False;True;True;0;True;-7;255;False;-1;255;True;-8;7;False;-1;3;False;-1;1;False;-1;1;False;-1;7;False;-1;3;False;-1;1;False;-1;1;False;-1;False;True;1;False;-1;False;False;True;1;LightMode=TransparentDepthPrepass;False;False;0;;0;0;Standard;0;True;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2968;-3941.374,-3630.745;Float;False;False;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;2;New Amplify Shader;53b46d85872c5b24c8f4f0a1c3fe4c87;True;TransparentDepthPostpass;0;9;TransparentDepthPostpass;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;True;1;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;-25;False;True;False;False;False;False;0;False;-1;False;False;False;False;False;False;False;False;False;True;1;False;-1;False;False;True;1;LightMode=TransparentDepthPostpass;False;False;0;;0;0;Standard;0;True;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2964;-3941.374,-3630.745;Float;False;False;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;2;New Amplify Shader;53b46d85872c5b24c8f4f0a1c3fe4c87;True;Motion Vectors;0;5;Motion Vectors;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;-25;False;False;False;False;False;False;False;False;False;True;True;0;True;-8;255;False;-1;255;True;-9;7;False;-1;3;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;1;False;-1;False;False;True;1;LightMode=MotionVectors;False;False;0;;0;0;Standard;0;True;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2966;-3941.374,-3630.745;Float;False;False;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;2;New Amplify Shader;53b46d85872c5b24c8f4f0a1c3fe4c87;True;TransparentBackface;0;7;TransparentBackface;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;True;1;0;True;-19;0;True;-20;1;0;True;-21;0;True;-22;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;-1;False;False;False;True;True;True;True;True;0;True;-44;False;False;False;False;False;False;False;True;0;True;-23;True;0;True;-31;False;True;1;LightMode=TransparentBackface;False;False;0;;0;0;Standard;0;True;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2962;-3941.374,-3630.745;Float;False;False;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;2;New Amplify Shader;53b46d85872c5b24c8f4f0a1c3fe4c87;True;SceneSelectionPass;0;3;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;False;False;False;False;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;;0;0;Standard;0;True;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2969;-3941.374,-3630.745;Float;False;False;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;2;New Amplify Shader;53b46d85872c5b24c8f4f0a1c3fe4c87;True;Forward;0;10;Forward;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;True;1;0;True;-19;0;True;-20;1;0;True;-21;0;True;-22;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;-28;False;False;False;True;True;True;True;True;0;True;-44;False;False;False;False;False;True;True;0;True;-4;255;False;-1;255;True;-5;7;False;-1;3;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;0;True;-23;True;0;True;-30;False;True;1;LightMode=Forward;False;False;0;;0;0;Standard;0;True;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2963;-3941.374,-3630.745;Float;False;False;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;2;New Amplify Shader;53b46d85872c5b24c8f4f0a1c3fe4c87;True;DepthOnly;0;4;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;-25;False;False;False;False;False;False;False;False;False;True;True;0;True;-6;255;False;-1;255;True;-7;7;False;-1;3;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;1;False;-1;False;False;True;1;LightMode=DepthOnly;False;False;0;;0;0;Standard;0;True;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2961;-3941.374,-3630.745;Float;False;False;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;2;New Amplify Shader;53b46d85872c5b24c8f4f0a1c3fe4c87;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;-25;False;True;False;False;False;False;0;False;-1;False;False;False;False;False;False;False;False;False;True;1;False;-1;True;3;False;-1;False;True;1;LightMode=ShadowCaster;False;False;0;;0;0;Standard;0;True;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2959;-3967.374,-3626.745;Float;False;True;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;2;DEC/Cutout Wind/Cutout Wind Translucency;53b46d85872c5b24c8f4f0a1c3fe4c87;True;GBuffer;0;0;GBuffer;35;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;4;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;NatureRendererInstancing=True;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;-25;False;False;False;False;False;False;False;False;False;True;True;0;True;-13;255;False;-1;255;True;-12;7;False;-1;3;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;False;True;0;True;-14;False;True;2;LightMode=GBuffer;NatureRendererInstancing=True;False;False;5;Include;;False;;Native;Pragma;instancing_options procedural:SetupNatureRenderer forwardadd;False;;Custom;Pragma;multi_compile GPU_FRUSTUM_ON __;False;;Custom;Include;Nature Renderer.cginc;False;2e03c613fd4055c4fb688be48c39a97a;Custom;Pragma;multi_compile_local _ NATURE_RENDERER;False;;Custom;;0;0;Standard;42;Surface Type;0;  Rendering Pass;1;  Refraction Model;0;    Blending Mode;0;    Blend Preserves Specular;1;  Receive Fog;1;  Back Then Front Rendering;0;  Transparent Depth Prepass;0;  Transparent Depth Postpass;0;  Transparent Writes Motion Vector;0;  Distortion;0;    Distortion Mode;0;    Distortion Depth Test;1;  ZWrite;0;  Z Test;4;Double-Sided;0;Alpha Clipping;1;  Use Shadow Threshold;1;Material Type,InvertActionOnDeselection;5;  Energy Conserving Specular;1;  Transmission;1;Receive Decals;1;Receives SSR;1;Receive SSR Transparent;0;Motion Vectors;1;  Add Precomputed Velocity;0;Specular AA;1;Specular Occlusion Mode;2;Override Baked GI;0;Depth Offset;0;DOTS Instancing;0;LOD CrossFade;1;Tessellation;0;  Phong;0;  Strength;0.5,False,-1;  Type;0;  Tess;16,False,-1;  Min;0,False,-1;  Max;25,False,-1;  Edge Length;16,False,-1;  Max Displacement;25,False,-1;Vertex Position;1;0;11;True;True;True;True;True;True;False;False;False;False;True;False;;True;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2965;-3941.374,-3630.745;Float;False;False;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;2;New Amplify Shader;53b46d85872c5b24c8f4f0a1c3fe4c87;True;Distortion;0;6;Distortion;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;True;4;1;False;-1;1;False;-1;4;1;False;-1;1;False;-1;True;1;False;-1;1;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;0;True;-10;255;False;-1;255;True;-11;7;False;-1;3;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;2;False;-1;True;3;False;-1;False;True;1;LightMode=DistortionVectors;False;False;0;;0;0;Standard;0;True;0
WireConnection;2982;1234;2976;2190
WireConnection;2982;1274;2976;2970
WireConnection;2959;0;2982;38
WireConnection;2959;1;2982;35
WireConnection;2959;2;2984;9
WireConnection;2959;7;2982;33
WireConnection;2959;8;2982;34
WireConnection;2959;9;2982;46
WireConnection;2959;10;2982;814
WireConnection;2959;30;2986;0
WireConnection;2959;13;2985;0
WireConnection;2959;14;2985;1
WireConnection;2959;16;2982;655
WireConnection;2959;21;2983;0
WireConnection;2959;11;2982;1235
ASEEND*/
//CHKSM=48ED62357DF4C5654B558DC5E2AC7662572C16F8
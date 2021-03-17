# ProjectRED

These are some Second Life shader and modifications to the for the Firestorm client that I rewrote based on the tutorials from https://learnopengl.com/. Most

So whats changed?
- Proper layout qualifiers instead of the dated varyings and out qualifiers.
- Modified the SSAO shader and utilities in aoUtil.glsl to require a bit less math and added a few samples.
- Small optimizations like reimplementing operations to use multiply, add, and divide operations to hopefully boost performance if the compiler misses them.
- Swapping over deferred lighting BRDF used for pointlighting and environmental lighting. (This was primarily conducted in the materialsf.glsl, softenlightf.glsl, pointlightF.glsl in the class 1 and class 2 shaders.
- Recycled some of the data provided by the client that was used for environmental lighting to allow for physically based reflectance, rather than the defualt non energy preserving strange normalized blinn phong model Linden Labs was using. Currently the shaders are inverting a gloss map that is packed in the alpha channel of the normal map to allow for roughness calculations, it recycles the environmental shine map packed in the specular alpha channel as a metallic map, as that seems to be the intent of it anyways, and lastly uses diffuse as albedo. TLDR, I've moving stuff to a roughness, metallic, and albedo model.


What needs to be done?
- Currently there are three shader classes for different hardware spec, some of it very ancient, and I intent to do some pruning to simplify the amount of code that needs to be maintained.
- Investigate going tall with the shaders and making some uber shaders that handle more or less all of the lighting.
- Modernizing spotlights.
- Reworking the incredibly dated SSAO and fix shadows.
- Cleaning up the naming conventions and documenting stuff.
- Investigating abandoning one of the rendering modes and focusing purely on deferred or forward rendering. This would likely require engine changes, but I have already gutted a lot of fixed function or pre-OpenGl 4.2 stuff. My logic is that if this goes big or catches on, Im likely not effecting a lot of Second Life players or ones that invest into the game anyways.
- Ideally, it would be nice to implement some sort of screen space reflections or global illumination system to atleast allow for radiosity.
- Implement a better version of image based lighting and BRDF look up table.
- Fresnel still appears to be broken or something is messing with it.

Why did I do this?
- I got tired of the game looking like garbage, running like garbage, and the lack of meaningful graphics development on the platform.
- People have been dreaming and salivating at the thought of physically based rendering in Second Life for quite some time, and I had hoped that if I fixed stuff up enough, it might force the developers to invest more in the graphics side of the game.
- I create and sell content in Second Life, and Ive peaked at the rendering engine and noticed there is no shortage of data to work with, and things can and should look and run good. Specifically, I want metallic items to look better than they do, as they currently resemble a grey muddied smear.

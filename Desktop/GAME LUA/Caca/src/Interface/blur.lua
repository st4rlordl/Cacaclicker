blur1 = love.graphics.newShader [[

    vec4 effect(vec4 color, Image texture, vec2 vTexCoord, vec2 pixel_coords)
    {
        vec4 sum = vec4(0.0);
        number blurSize = 0.02;
        
        // Coefficients gaussiens pour un flou 9 échantillons
        number kernel[9];
        kernel[0] = 0.05;
        kernel[1] = 0.09;
        kernel[2] = 0.12;
        kernel[3] = 0.15;
        kernel[4] = 0.16;
        kernel[5] = 0.15;
        kernel[6] = 0.12;
        kernel[7] = 0.09;
        kernel[8] = 0.05;

        // Appliquer le flou gaussien verticalement (axe Y)
        sum += texture2D(texture, vec2(vTexCoord.x, vTexCoord.y - 4.0 * blurSize)) * kernel[0];
        sum += texture2D(texture, vec2(vTexCoord.x, vTexCoord.y - 3.0 * blurSize)) * kernel[1];
        sum += texture2D(texture, vec2(vTexCoord.x, vTexCoord.y - 2.0 * blurSize)) * kernel[2];
        sum += texture2D(texture, vec2(vTexCoord.x, vTexCoord.y - blurSize)) * kernel[3];
        sum += texture2D(texture, vec2(vTexCoord.x, vTexCoord.y)) * kernel[4];  // centre
        sum += texture2D(texture, vec2(vTexCoord.x, vTexCoord.y + blurSize)) * kernel[5];
        sum += texture2D(texture, vec2(vTexCoord.x, vTexCoord.y + 2.0 * blurSize)) * kernel[6];
        sum += texture2D(texture, vec2(vTexCoord.x, vTexCoord.y + 3.0 * blurSize)) * kernel[7];
        sum += texture2D(texture, vec2(vTexCoord.x, vTexCoord.y + 4.0 * blurSize)) * kernel[8];

        // Appliquer le flou gaussien horizontalement (axe X)
        vec4 horizontalBlur = vec4(0.0);
        horizontalBlur += texture2D(texture, vec2(vTexCoord.x - 4.0 * blurSize, vTexCoord.y)) * kernel[0];
        horizontalBlur += texture2D(texture, vec2(vTexCoord.x - 3.0 * blurSize, vTexCoord.y)) * kernel[1];
        horizontalBlur += texture2D(texture, vec2(vTexCoord.x - 2.0 * blurSize, vTexCoord.y)) * kernel[2];
        horizontalBlur += texture2D(texture, vec2(vTexCoord.x - blurSize, vTexCoord.y)) * kernel[3];
        horizontalBlur += texture2D(texture, vec2(vTexCoord.x, vTexCoord.y)) * kernel[4];  // centre
        horizontalBlur += texture2D(texture, vec2(vTexCoord.x + blurSize, vTexCoord.y)) * kernel[5];
        horizontalBlur += texture2D(texture, vec2(vTexCoord.x + 2.0 * blurSize, vTexCoord.y)) * kernel[6];
        horizontalBlur += texture2D(texture, vec2(vTexCoord.x + 3.0 * blurSize, vTexCoord.y)) * kernel[7];
        horizontalBlur += texture2D(texture, vec2(vTexCoord.x + 4.0 * blurSize, vTexCoord.y)) * kernel[8];

        // Mélanger le flou horizontal et vertical
        sum = (sum + horizontalBlur) / 2.0;

        return sum;
    }
]]

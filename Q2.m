clear;

k=100;
buffer1 = [];
buffer2 = [];
p = 0.2;
if rand < p
    i1 = 1;
else
    i1 = 0;
end

if rand < p
    i2 = 1;
else
    i2 = 0;
end

if rand < 0.5
    d11 = 1;    d12 = 0;
else
    d11 = 0;    d12 = 1;
end

if rand < 0.5
    d21 = 1;    d22 = 0;
else
    d21 = 0;    d22 = 1;
end

if d11==1 && d21==1
    if rand < 0.5
        o1 = i1*d11;
        buffer2 = [buffer2 i2];
    else
        o1 = i2*d21;
        buffer1 = [buffer1 i1];
    end
elseif d12==1 && d22==1
    if rand < 0.5
        o2 = i1*d11;
        buffer2 = [buffer2 i2];
    else
        o2 = i2*d21;
        buffer1 = [buffer1 i1];
    end
elseif d11==1 && d22==1
	o1 = i1*d11;
    o2 = i2*d22;
    if buffer1 ~= []
        buffer1 = buffer1(1:end-1);
    end
    if buffer2 ~= []
        buffer2 = buffer2(1:end-1);
    end
elseif d12==1 && d21==1
    o1 = i2*d21;
    o2 = i1*d12;
    if buffer1 ~= []
        buffer1 = buffer1(1:end-1);
    end
    if buffer2 ~= []
        buffer2 = buffer2(1:end-1);
    end
end

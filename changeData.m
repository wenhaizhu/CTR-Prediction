function [ X ] = changeData( ds )
%UNTITLED4 Summary of this function goes here
x1 = ds.hour;
x2 = ds.C1;
x3 = ds.banner_pos;
x4 = double(hex2dec(ds.site_id));
x5 = double(hex2dec(ds.site_domain));
x6 = double(hex2dec(ds.site_category));
x7 = double(hex2dec(ds.app_id));
x8 = double(hex2dec(ds.app_domain));
x9 = double(hex2dec(ds.app_category));
x10 = double(hex2dec(ds.device_id));
x11 = double(hex2dec(ds.device_ip));
x12 = double(hex2dec(ds.device_model));
x13 = ds.device_type;
x14 = ds.device_conn_type;
x15 = ds.C14;
x16 = ds.C15;
x17 = ds.C16;
x18 = ds.C17;
x19 = ds.C18;
x20 = ds.C19;
x21 = ds.C20;
x22 = ds.C21;

X = [x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 x21 x22];
end


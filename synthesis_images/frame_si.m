function counter=frame_si(u)

% used for sub-frame construction
% there are 3 parts in all
%% first part : parameter initializtion
counter=0;
rest=0.02;% frame time ,unit: us
pde=0.5;%photon detection effe
t=1;% snap time: 15ms
lam=u/t;% the mean of photons in 1 ms
% dead=1e-4;%set dead time to 1
% ilam=t/u;
% disp(lam*rest)
% while(rest>0)
% a=exprnd(ilam);
% rest=rest-a;
% % disp(rest)
% if rest>0
%     if pde>rand(1)
%     counter=1+counter;%count how many photons come
%     end
% %     disp(rest)
% end
% end
% 
% rest=rest+a+dead;
p=1-exp(-(lam*(rest)));
if p>rand(1)
    if pde>rand(1)
        counter=1+counter;
    end
end


end
function P = edit_new_bspline(n,CP,myimage,hObject,handles)
% Get control points of uniform B-spline interactively.
% The user is shown a figure window in which to choose B-spline control
% points. As points are placed in the axes, the B-spline of specified order
% is drawn progressively. The user may terminate adding control points by
% pressing ENTER or ESC, or may place the last control point with a right
% mouse button click. Once done, control points may be adjusted with
% drag-and-drop. Control point adjustment can work in 3D; use the rotation
% tool to set a different camera position.
%
% Input arguments:
% n (optional):
%    B-spline order (defaults to cubic spline, n = 4)

% Copyright 2010 Levente Hunyadi

% Copyright 2017 Athanasios Ktistakis
% Edited and modified..

    %Using cubic splines as a default
    n=4;
    fig = figure( ...
        'Name', 'Interactive uniform B-spline', ...
        'NumberTitle', 'off');

    % axes for drawing
    ax = axes('Parent', fig);
    
%    uicontrol('Style', 'text',...
%    'String', 'Space - New Spline',... %replace something with the text you want
%    'Units','normalized',...
%    'Position', [0.1 0.8 0.1 0.1]); 

    dim = [.2 .2 .2 .2];
    str = {'Space - New Spline','Return - Terminate'};
    t = annotation('textbox',dim,'String',str,'FitBoxToText','on','Position',[0.2 0.1 0.2 0.2],'Color','blue');
%     t = annotation('textbox');
%     sz = t.FontSize;
%     t.FontSize = 11;
%     t.String = {'first line','second line'};

    x = [];       % x-coordinate of control points
    y = [];       % y-coordinate of control points
    z = [];       % z-coordinate of control points
    w = [];       % weights of control points
    ix = [];      % index of currently selected point
    dragix = [];  % index of currently selected point for dragging

    ctrl = line(-1, -1, ...
        'Parent', ax, ...
        'Color', 'b', ...
        'Marker', 'x');
    spline = line(0, 0, ...
        'Parent', ax, ...
        'Color', 'r');
    selection = line(0, 0, ...
        'Parent', ax, ...
        'Color', 'b', ...
        'Marker', 'o');
    
    handles = guidata(hObject);

    try
        % setting a random Bspline in case the input matrix is empty
        if isempty(CP)                
            x = [0.1 0.2 0.4 0.5 0.6 0.5];
            y = [0.5 0.7 0.6 0.5 0.4 0.3];
            z = [ 0 0 0 0 0 0];
            w = [ 1 1 1 1 1 1];
        else
           % if an initial Contour is given    
       
           CPlength= length(CP);
           

            newPointSize = length(CP);
            x = CP(1,:);
            y = CP(2,:);
            z = zeros(1,size(CP,2));
            w = ones(1,size(CP,2));        
        end

        set(ctrl, 'XData', x, 'YData', y);
        bspline_gui_drawspline();
        hold on 
        % showing the original slice on the back using AlphaData for
        % setting the transparency 
        h = imshow(myimage,'InitialMag', 'fit');
        set(h, 'AlphaData', 0.7, 'AlphaDataMapping','none');
        
        set(fig, 'WindowButtonDownFcn', @bspline_gui_onmousedown);
        set(fig, 'WindowButtonUpFcn', @bspline_gui_onmouseup);
        set(fig, 'WindowButtonMotionFcn', @bspline_gui_onmousemove);
        set(fig, 'WindowKeyPressFcn', @bspline_gui_onreturndown);
        uiwait(fig);
        hold off
    catch ex
        switch ex.identifier
            case 'MATLAB:ginput:FigureDeletionPause'
                % preserve values for x and y
            otherwise
                rethrow(ex);
        end
    end
    
    if nnz(z) > 0  % 3D
        P = [x;y;z];
    else  % 2D
        P = [x;y];
    end
%     if nargout < 1
%         
%         disp(mat2str(P,4));
%     end

    function bspline_gui_drawspline()
    % Draws a uniform B-spline.
        if n <= 2 || numel(x) < n  % not meaningful to draw constant or linear spline, or insufficient control points to draw higher-order spline
            return;
        end
        t = [ zeros(1, n-1) linspace(0,1,numel(x)-n+2) ones(1, n-1) ];  % knot vector
        X = bspline_wdeboor(n,t,[x;y;z],w);
        set(spline, 'XData', X(1,:), 'YData', X(2,:), 'ZData', X(3,:));       
    end
    
    function bspline_gui_onmousedown(fig, event) %#ok<INUSD>
    % Fired when the user presses the mouse button.
        cp = get(ax, 'CurrentPoint');
        [q,dist] = project_points_line([x;y;z], transpose(cp(1,:)), transpose(cp(2,:))); %#ok<ASGLU>
        [mindist,minix] = min(dist);  % closest point
        if mindist < 1.5   %original value was 0.05
            dragix = minix;  % grab point
            ix = dragix;
            bspline_gui_select();
        end
    end

    function bspline_gui_onmouseup(fig, event) %#ok<INUSD>
    % Fired when the user releases the mouse button.
        dragix = [];  % no currently selected point
    end

    function bspline_gui_onreturndown(fig, event)
        % Fired when the user presses the enter button.
        keyPressed = event.Key;
        if strcmpi(keyPressed,'space')
            disp('space button');
            %n,CP,myimage,axisobj
            
            
        end
       
        if strcmpi(keyPressed,'return')
            disp('return button');
            x(:,newPointSize+1) = x(:,1);
%             x(:,newPointSize+2) = x(:,2);
%             x(:,newPointSize+3) = x(:,3);

            y(:,newPointSize+1) = y(:,1);
%             y(:,newPointSize+2) = y(:,2);
%             y(:,newPointSize+3) = y(:,3);

            z = zeros(1,size(x,2));
            w = ones(1,size(x,2));        

            t = [ zeros(1, n-1) linspace(0,1,numel(x)-n+2) ones(1, n-1) ];  % knot vector
            X = bspline_wdeboor(n,t,[x;y;z],w);
            set(spline, 'XData', X(1,:), 'YData', X(2,:), 'ZData', X(3,:));
            bspline_gui_drawspline();
            bspline_gui_select();
            
           save('contourwdeboor.mat','X'); 
           
           Contour2D = X(1:2,:);
           size(Contour2D)
           size(myimage)
           Contnew = zeros(length(Contour2D),2);
           Contnew(:,1) = Contour2D(1,:);
           Contnew(:,2) = Contour2D(2,:);
%            trContnew = Contnew.';
           
           Cnt(:,1) = Contnew(:,2);
           Cnt(:,2) = Contnew(:,1);

           justanimage=DrawSegmentedArea2D(Cnt,size(myimage));
           size(justanimage)
           
           typeofsnakeObj = get(handles.pnlsnaketype,'SelectedObject');
           choice = get(typeofsnakeObj,'String')
           switch choice
                case 'Shrinking'
                    mynewseg = segmented_area.*myimage;
                case 'Expansion'
                    mynewseg = (~segmented_area).*myimage;
           end
           
%            %flip image 
%            trjustanimage = justanimage.';
%            size(justanimage)
%            size(myimage)
%            mynewseg = justanimage.*myimage;
%             figure; imshow(justanimage)
           
          %show that to the main gui window
           axes(handles.axes1)
           imshow(mynewseg)
           disp('saving segmented image')
           handles.mySegmentedImage = mynewseg;
           guidata(hObject, handles);


        end
    end

    function bspline_gui_onmousemove(fig, event) %#ok<INUSD>
    % Fired when the user moves the mouse.
        if isempty(dragix)  % no point selected (not in drag mode)
            return;
        end
        cp = get(ax, 'CurrentPoint');
        q = project_points_line([x(dragix);y(dragix);z(dragix)], transpose(cp(1,:)), transpose(cp(2,:)));  % project current point to line of selection
%         q = coerce_range(q, 0, 1);  % force position into unit range
        x(dragix) = q(1);
        y(dragix) = q(2);
        z(dragix) = q(3);
        bspline_gui_redraw();
    end

    function bspline_gui_select()
    % Update current selection.
        if ~isempty(ix)
            set(selection, 'XData', x(ix), 'YData', y(ix), 'ZData', z(ix), 'Visible', 'on');
        else
            set(selection, 'XData', x(ix), 'YData', y(ix), 'ZData', z(ix), 'Visible', 'off');
        end
%         bspline_gui_getpoint();
        drawnow;
    end

    function bspline_gui_redraw()
    % Redraw control polygon and current selection.
        set(ctrl, 'XData', x, 'YData', y, 'ZData', z);
        bspline_gui_drawspline();
        bspline_gui_select();
    end
end

function [Q,dist] = project_points_line(P, p1, p2)
% Project points P to a line given by two points p1 and p2.
%
% Input arguments:
% P:
%    an n-by-M matrix of M points to project
% p1, p2:
%    an n-by-1 column vectors that define the line
%
% Output arguments:
% Q:
%    an n-by-M matrix of M projected points
% dist:
%    a vector of distances between original and projected points
    validateattributes(P, {'numeric'}, {'real','2d'});
    validateattributes(p1, {'numeric'}, {'real','column'});
    validateattributes(p2, {'numeric'}, {'real','column'});

    p1 = p1(:);
    p2 = p2(:);
    d = (p1-p2) / norm(p1-p2);  % unit direction vector of line
    Q = bsxfun(@plus, p1, bsxfun(@times, (d' * bsxfun(@minus, P, p1)), d));  % projection of points on line
    if nargout > 1
        dist = sqrt(sum((P-Q).^2, 1));  % distance of original points and projections
    end
end

function M = coerce_range(M, lower, upper)
% Coerce entries of an array into the specified range.
    M(M < lower) = lower;
    M(M > upper) = upper;
end